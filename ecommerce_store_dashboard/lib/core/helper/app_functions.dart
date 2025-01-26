import 'dart:developer';
import 'dart:html' as html;

import 'package:dio/dio.dart';
import 'package:ecommerce_store_dashboard/core/helper/extensions.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../features/products/presentation/add_product_cubit/add_product_cubit.dart';
import '../databases/api/end_points.dart';
import '../databases/cache/secure_storage_helper.dart';
import '../databases/cache/shared_prefs_helper.dart';
import '../utils/constants/constant.dart';
import '../utils/services/service_locator.dart';

SystemUiOverlayStyle getSystemUiOverlayStyle(Brightness currentBrightness, BuildContext context) {
  return currentBrightness == Brightness.light
      ? SystemUiOverlayStyle.light.copyWith(
          systemNavigationBarColor: Theme.of(context).colorScheme.surface,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: Theme.of(context).colorScheme.inversePrimary,
        )
      : SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Theme.of(context).colorScheme.inversePrimary,
          systemNavigationBarColor: Theme.of(context).colorScheme.surface,
          systemNavigationBarIconBrightness: Brightness.light,
        );
}

Future<XFile?> pickImage() async {
  final ImagePicker picker = ImagePicker();
  final image = await picker.pickImage(source: ImageSource.gallery); // or ImageSource.camera
  return image;
}

Future uploadImageToApi(XFile? image) async {
  if (image == null) return null;
  return MultipartFile.fromFile(image.path, filename: image.path.split('/').last);
}

class RouteObserverService extends NavigatorObserver {
  final List<String> routeHistory = [];

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    log('Pushed route: ${route.settings.name}');
    routeHistory.add(route.settings.name ?? 'Unknown');
    printRouteHistory();
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    log('Popped route: ${route.settings.name}');
    routeHistory.removeLast();
    printRouteHistory();
  }

  void printRouteHistory() {
    log('Current navigation stack:');
    for (var route in routeHistory) {
      log(route);
    }
  }
}

checkIfLoggedInUser() async {
  String? userToken = await SecureStorageHelper().getData(key: CacheKey.accessToken);
  if (!userToken!.isNullOrEmpty()) {
    isLoggedInUser = true;
    log(userToken);
  } else {
    isLoggedInUser = false;
  }
}

checkIfFirstTime() async {
  isFristTime = await getIt<SharedPrefsHelper>().getData(key: CacheKey.isFirstTime);
  if (isFristTime == null) {
    isFristTime = true;
    await getIt<SharedPrefsHelper>().saveData(key: CacheKey.isFirstTime, value: isFristTime);
  }
}

bool isRtl(BuildContext context) {
  final textDirection = Directionality.of(context);
  final isRtl = textDirection == TextDirection.rtl;
  return isRtl;
}

Widget buildSection({
  required String title,
  required List<Widget> children,
}) {
  return Container(
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        ...children,
      ],
    ),
  );
}

Widget buildTextField({
  required String label,
  required TextEditingController controller,
  int maxLines = 1,
  TextInputType? keyboardType,
  String? Function(String?)? validator,
  TextDirection? textDirection,
}) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      filled: true,
      fillColor: Colors.grey[50],
    ),
    maxLines: maxLines,
    keyboardType: keyboardType,
    validator: validator,
    textDirection: textDirection,
    controller: controller,
  );
}

Widget buildDropdown({
  required String label,
  required String? value,
  required List<String> items,
  required void Function(String?)? onChanged,
}) {
  return DropdownButtonFormField<String>(
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      filled: true,
      fillColor: Colors.grey[50],
    ),
    value: value,
    items: items
        .map((item) => DropdownMenuItem(
              value: item,
              child: Text(item),
            ))
        .toList(),
    onChanged: onChanged,
  );
}

Widget buildImageUpload({
  required String label,
  required bool isMain,
  required BuildContext context,
  required PlatformFile? mainImage,
  required Map<String, String> imageUrls,
  required List<PlatformFile> subImages,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label),
      const SizedBox(height: 8),
      if (isMain)
        InkWell(
          onTap: () async {
            context.read<AddProductCubit>().pickImage(false);
          },
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: buildMainImagePreview(context, mainImage, imageUrls),
          ),
        ),
      if (!isMain) buildSubImagesPreview(context, subImages, imageUrls),
    ],
  );
}

Widget buildMainImagePreview(BuildContext context, PlatformFile? mainImage, Map<String, String> imageUrls) {
  if (mainImage != null && imageUrls.containsKey(mainImage!.name)) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            imageUrls[mainImage.name]!,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                context.read<AddProductCubit>().deleteMainImage();
              },
            ),
          ),
        ],
      ),
    );
  }

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.cloud_upload,
          size: 48,
          color: Theme.of(context).primaryColor,
        ),
        const SizedBox(height: 8),
        Text(
          'Click to upload main image',
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
      ],
    ),
  );
}

Widget buildSubImagesPreview(BuildContext context, List<PlatformFile> subImages, Map<String, String> imageUrls) {
  if (subImages.isEmpty) {
    return InkWell(
      onTap: () async {
        context.read<AddProductCubit>().pickImage(true);
      },
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.cloud_upload,
                size: 48,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 8),
              Text(
                'Click to upload sub images (up to 7)',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  return Container(
    height: 200,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(8),
    ),
    child: GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: subImages.length + 1,
      itemBuilder: (context, index) {
        if (index == subImages.length) {
          return SizedBox(
            height: 200,
            child: InkWell(
              onTap: () async {
                context.read<AddProductCubit>().pickImage(true);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, // Border color
                    width: 2, // Border width
                  ),
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, size: 30, color: Colors.grey),
                      SizedBox(height: 8),
                      Text(
                        "Add New Image",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        final image = subImages[index];
        if (!imageUrls.containsKey(image.name)) {
          return const Center(child: CircularProgressIndicator());
        }

        return SizedBox(
          height: 200,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrls[image.name]!,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 20,
                  ),
                  onPressed: () {
                    context.read<AddProductCubit>().deleteSubImage(index);
                  },
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

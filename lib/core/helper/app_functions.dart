import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/core/helper/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../Routes/app_routes.dart';
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
  log(userToken!);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
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

String chooseInitialRoute() {
  if (isFristTime!) {
    return AppRoutes.splashRoute;
  } else if (isLoggedInUser) {
    return AppRoutes.homeRoute;
  } else {
    return AppRoutes.loginRoute;
  }
}

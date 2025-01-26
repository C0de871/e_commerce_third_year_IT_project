import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_store_dashboard/core/databases/params/params.dart';
import 'package:ecommerce_store_dashboard/features/products/domain/entities/add_products_entities/add_product_entity.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

import '../../../../core/databases/api/end_points.dart';
import '../../../../core/utils/services/service_locator.dart';
import '../../domain/use_cases/add_product_use_case.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProduct addProductUseCase;

  AddProductCubit()
      : addProductUseCase = getIt(),
        super(AddProductInitial());

  final formKey = GlobalKey<FormState>();
  PlatformFile? mainImage;
  List<PlatformFile> subImages = [];
  final List<String> enCategories = [
    'Electronics',
    'Clothing',
    'Food',
    'Books',
    'Furniture',
    'Toys',
    'Sports',
    'Beauty',
    'Health',
    'Jewelry',
    'Home Appliances',
    'Stationery',
    'Pet Supplies',
    'Automotive',
    'Garden',
    'Movies',
    'Games',
    'Office Supplies',
    'Kitchenware',
  ];

  final List<String> arCategories = [
    'الكترونيات',
    'ملابس',
    'أطعمة',
    'كتب',
    'أثاث',
    'ألعاب',
    'رياضة',
    'جمال',
    'صحة',
    'مجوهرات',
    'أدوات منزلية',
    'قرطاسية',
    'مستلزمات حيوانات',
    'سيارات',
    'حدائق',
    'أفلام',
    'ألعاب',
    'مستلزمات مكتبية',
    'أدوات المطبخ',
  ];
  String? selectedEnCategory;
  String? selectedArCategory;
  Map<String, String> imageUrls = {};

  TextEditingController nameEnController = TextEditingController();
  TextEditingController nameArController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController descEnController = TextEditingController();
  TextEditingController descArController = TextEditingController();

  void addProductTrigger(int storeID) async {
    emit(AddProductLoading());
    Map<String, dynamic> body = {
      ApiKey.nameEn: nameEnController.text,
      ApiKey.nameAr: nameEnController.text,
      ApiKey.descriptionAr: descArController.text,
      ApiKey.descriptionEn: descEnController.text,
      ApiKey.categoryNameAr: selectedArCategory,
      ApiKey.categoryNameEn: selectedEnCategory,
      ApiKey.price: priceController.text,
      ApiKey.quantity: quantityController.text,
      ApiKey.mainImage: await uploadImageToApi(mainImage),
    };
    for (var i = 0; i < subImages.length; i++) {
      body[ApiKey.subImages(i)] = await uploadImageToApi(subImages[i]);
    }

    AddProductParams params = AddProductParams(storeID: storeID);

    final response = await addProductUseCase.call(params: params, body: body);

    response.fold(
      (failure) => emit(
        AddProductError(failure.errMessage),
      ),
      (addProductEntity) => emit(
        AddProductSuccess(addProductEntity: addProductEntity),
      ),
    );
  }

  void _createImageUrl(PlatformFile file, bool allowMultiple) {
    final reader = html.FileReader();
    final blob = html.Blob([file.bytes!]); // Create a Blob from the Uint8List
    reader.readAsDataUrl(blob);
    reader.onLoad.listen((event) {
      imageUrls[file.name] = reader.result as String;
      if (allowMultiple) {
        emit(UploadSubImageSuccess());
      } else {
        emit(UploadMainImageSuccess());
      }
    });
  }

  Future<MultipartFile?> uploadImageToApi(PlatformFile? file) async {
    if (file == null) return null;
    if (file.bytes != null) {
      return MultipartFile.fromBytes(
        file.bytes!,
        filename: file.name,
      );
    }
    return null;
  }

  void pickImage(bool allowMultiple) async {
    if (allowMultiple) {
      emit(UploadSubImageLoading());
    } else {
      emit(UploadMainImageLoading());
    }
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
      allowMultiple: allowMultiple,
    );

    if (result != null) {
      if (!allowMultiple) {
        mainImage = result.files.first;
        _createImageUrl(mainImage!, allowMultiple);
      } else {
        final newImages = result.files.take(7 - subImages.length).toList();

        for (var file in newImages) {
          _createImageUrl(file, allowMultiple);
        }
        subImages.addAll(newImages);
      }
    }
  }

  void deleteMainImage() {
    imageUrls.remove(mainImage!.name);
    mainImage = null;
    emit(StatusChange());
  }

  void deleteSubImage(int index) {
    imageUrls.remove(subImages[index].name);
    subImages.removeAt(index);
    emit(StatusChange());
  }

  void updateArabicDropDownBox(String? value) {
    selectedArCategory = value;
    emit(StatusChange());
  }

  void updateEnglishDropDownBox(String? value) {
    selectedEnCategory = value;
    emit(StatusChange());
  }

  @override
  void onChange(Change<AddProductState> change) {
    // TODO: implement onChange
    super.onChange(change);
  }
}

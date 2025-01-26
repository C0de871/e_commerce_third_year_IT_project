// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import '../../../../core/databases/api/api_consumer.dart';
import '../../../../core/databases/api/end_points.dart';
import '../../../../core/databases/cache/secure_storage_helper.dart';
import '../../../../core/databases/params/params.dart';
import '../model/add_product_models/add_product_model.dart';
import '../model/show_store_models/show_store_model.dart';

class ProductsRemoteDataSource {
  final ApiConsumer api;
  final SecureStorageHelper cacheHelper;
  ProductsRemoteDataSource({
    required this.api,
    required this.cacheHelper,
  });
  Future<AddProductModel> addProduct(
    AddProductParams params,
    Map<String, dynamic> body,
  ) async {
    Map<String, dynamic> headers = {
      ApiKey.authorization: await cacheHelper.getData(key: CacheKey.accessToken),
    };

    Map<String, dynamic> extra = {
      ApiKey.requiredAuth: true,
    };
    final response = await api.post(
      EndPoints.addProduct(params.storeID),
      headers: headers,
      extra: extra,
      data: body,
      isFormData: true,
    );
    return AddProductModel.fromMap(response);
  }

  Future<ShowStoreModel> showStore(
    ShowStoreParams params,
  ) async {
    Map<String, dynamic> headers = {
      ApiKey.authorization: await cacheHelper.getData(key: CacheKey.accessToken),
    };

    Map<String, dynamic> extra = {
      ApiKey.requiredAuth: true,
    };
    final response = await api.get(
      EndPoints.showStoreAndProducts(params.storeID),
      headers: headers,
      extra: extra,
    );
    return ShowStoreModel.fromMap(response);
  }
}

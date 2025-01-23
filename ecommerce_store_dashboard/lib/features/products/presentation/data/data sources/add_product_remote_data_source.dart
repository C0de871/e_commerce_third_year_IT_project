// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import '../../../../../core/databases/api/api_consumer.dart';
import '../../../../../core/databases/api/end_points.dart';
import '../../../../../core/databases/cache/secure_storage_helper.dart';
import '../../../../../core/databases/params/params.dart';
import '../model/add_product_model.dart';

class AddProductRemoteDataSource {
  final ApiConsumer api;
  final SecureStorageHelper cacheHelper;
  AddProductRemoteDataSource({
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
    log(EndPoints.addProduct(11));
    final response = await api.post(
      "${EndPoints.addProduct(11)}",
      headers: headers,
      extra: extra,
      data: body,
      isFormData: true,
    );
    return AddProductModel.fromMap(response);
  }
}

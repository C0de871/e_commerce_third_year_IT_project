// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/core/databases/api/api_consumer.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/databases/cache/secure_storage_helper.dart';
import 'package:e_commerce/features/products/data/models/get_all_products_model.dart';

import '../../../../core/databases/params/params.dart';

class ProductRemoteDataSource {
  final ApiConsumer apiConsumer;
  final SecureStorageHelper cacheHelper;

  ProductRemoteDataSource({
    required this.apiConsumer,
    required this.cacheHelper,
  });

  Future<GetAllProductsModel> getAllProducts({required ProductParams params}) async {
    String? accessToken = await cacheHelper.getData(key: CacheKey.accessToken);

    Map<String, dynamic> headers = {
      ApiKey.authorization: accessToken,
    };

    bool isLoggedIn = (accessToken != null) ? true : false;

    Map<String, dynamic> extra = {
      ApiKey.requiredAuth: isLoggedIn,
    };

    final response = await apiConsumer.get(
      EndPoints.getAllProducts,
      queryParameters: params.toJson(),
      headers: headers,
      extra: extra,
    );
    return GetAllProductsModel.fromMap(response);
  }
}

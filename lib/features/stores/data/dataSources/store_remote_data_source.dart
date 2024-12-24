// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/core/databases/api/api_consumer.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/features/stores/data/model/get_stores_model.dart';

import '../../../../core/databases/cache/secure_storage_helper.dart';

class StoreRemoteDataSource {
  final ApiConsumer api;
  final SecureStorageHelper cacheHelper;

  StoreRemoteDataSource({
    required this.api,
    required this.cacheHelper,
  });
  Future<GetStoresModel> getAllStores({required StoreParams params}) async {
    Map<String, dynamic> headers = {
      ApiKey.authorization: await cacheHelper.getData(key: CacheKey.accessToken),
    };

    bool isLoggedIn = (await cacheHelper.getData(key: CacheKey.accessToken) != null) ? true : false;

    Map<String, dynamic> extra = {
      ApiKey.requiredAuth: isLoggedIn,
    };

    final response = await api.get(
      EndPoints.getAllStores,
      queryParameters: params.toJson(),
      headers: headers,
      extra: extra,
    );
    return GetStoresModel.fromMap(response);
  }
}

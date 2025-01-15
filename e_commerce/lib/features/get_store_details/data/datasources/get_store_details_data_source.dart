import 'package:e_commerce/features/get_store_details/data/models/show_store_model/show_store_model.dart';
import 'package:e_commerce/features/stores/data/model/get_stores_model.dart';

import '../../../../core/databases/api/api_consumer.dart';
import '../../../../core/databases/api/end_points.dart';
import '../../../../core/databases/cache/secure_storage_helper.dart';
import '../../../../core/databases/params/params.dart';

class GetStoreDetailsDataSource {
  final ApiConsumer api;
  final SecureStorageHelper cacheHelper;
  GetStoreDetailsDataSource({
    required this.api,
    required this.cacheHelper,
  });
  Future<ShowStoreModel> showStore(ShowStoreParams params) async {
    Map<String, dynamic> headers = {
      ApiKey.authorization: await cacheHelper.getData(key: CacheKey.accessToken),
    };

    bool isLoggedIn = (await cacheHelper.getData(key: CacheKey.accessToken) != null) ? true : false;

    Map<String, dynamic> extra = {
      ApiKey.requiredAuth: isLoggedIn,
    };
    final response = await api.get(
      EndPoints.showStore(params),
      headers: headers,
      extra: extra,
    );
    return ShowStoreModel.fromMap(response);
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../core/databases/api/api_consumer.dart';
import '../../../../core/databases/api/end_points.dart';
import '../../../../core/databases/cache/secure_storage_helper.dart';
import '../../../../core/databases/params/params.dart';
import '../models/toggle_fav_model.dart';

class FavoritesRemoteDataSource {
  final ApiConsumer api;
  final SecureStorageHelper cacheHelper;
  FavoritesRemoteDataSource({
    required this.api,
    required this.cacheHelper,
  });
  Future<ToggleFavModel> getToggleFavOn(ToggleFavParams params) async {
    Map<String, dynamic> headers = {
      ApiKey.authorization: await cacheHelper.getData(key: CacheKey.accessToken),
    };

    bool isLoggedIn = (await cacheHelper.getData(key: CacheKey.accessToken) != null) ? true : false;

    Map<String, dynamic> extra = {
      ApiKey.requiredAuth: isLoggedIn,
    };
    final response = await api.get(
      "${EndPoints.toggleFavOn}/${params.storeID}/${params.productID}",
      headers: headers,
      extra: extra,
    );
    return ToggleFavModel.fromMap(response);
  }

  Future<ToggleFavModel> getToggleFavOff(ToggleFavParams params) async {
    Map<String, dynamic> headers = {
      ApiKey.authorization: await cacheHelper.getData(key: CacheKey.accessToken),
    };

    bool isLoggedIn = (await cacheHelper.getData(key: CacheKey.accessToken) != null) ? true : false;

    Map<String, dynamic> extra = {
      ApiKey.requiredAuth: isLoggedIn,
    };

    final response = await api.delete(
      "${EndPoints.toggleFavOff}/${params.storeID}/${params.productID}",
      headers: headers,
      extra: extra,
    );
    return ToggleFavModel.fromMap(response);
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../core/databases/api/api_consumer.dart';
import '../../../../core/databases/api/end_points.dart';
import '../../../../core/databases/cache/secure_storage_helper.dart';
import '../model/get_users_model/get_users_model.dart';

class GetUsersRemoteDataSource {
  final ApiConsumer api;
  final SecureStorageHelper cacheHelper;
  GetUsersRemoteDataSource({
    required this.api,
    required this.cacheHelper,
  });
  Future<GetUsersModel> getUsers() async {
    Map<String, dynamic> headers = {
      ApiKey.authorization: await cacheHelper.getData(key: CacheKey.accessToken),
    };

    // bool isLoggedIn = (await cacheHelper.getData(key: CacheKey.accessToken) != null) ? true : false;

    Map<String, dynamic> extra = {
      ApiKey.requiredAuth: true,
    };
    final response = await api.get(
      EndPoints.getUsers,
      headers: headers,
      extra: extra,
    );
    return GetUsersModel.fromMap(response);
  }
}

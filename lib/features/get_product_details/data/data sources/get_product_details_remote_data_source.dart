// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../core/databases/api/api_consumer.dart';
import '../../../../core/databases/api/end_points.dart';
import '../../../../core/databases/cache/secure_storage_helper.dart';
import '../../../../core/databases/params/params.dart';
import '../model/get_product_details.dart';

class GetProductDetailsRemoteDataSource {
  final ApiConsumer api;
  final SecureStorageHelper cacheHelper;
  GetProductDetailsRemoteDataSource({
    required this.api,
    required this.cacheHelper,
  });
  Future<GetProductDetailsModel> getProductDetails(
      GetProductDetailsParams params) async {
    Map<String, dynamic> headers = {
      ApiKey.authorization:
          await cacheHelper.getData(key: CacheKey.accessToken),
    };

    bool isLoggedIn =
        (await cacheHelper.getData(key: CacheKey.accessToken) != null)
            ? true
            : false;

    Map<String, dynamic> extra = {
      ApiKey.requiredAuth: isLoggedIn,
    };
    final response = await api.get(
      "${EndPoints.getProductDetails}/${params.id}/",
      headers: headers,
      extra: extra,
    );
    return GetProductDetailsModel.fromMap(response);
  }
}

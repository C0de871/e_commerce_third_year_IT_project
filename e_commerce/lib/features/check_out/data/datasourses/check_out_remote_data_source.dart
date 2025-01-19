import 'package:e_commerce/core/databases/api/api_consumer.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/databases/cache/secure_storage_helper.dart';
import 'package:e_commerce/features/check_out/data/models/check_out_order_model.dart';

class CheckOutRemoteDataSource {
  final ApiConsumer api;
  final SecureStorageHelper cacheHelper;
  CheckOutRemoteDataSource({required this.cacheHelper, required this.api});
//! create order:
  Future<CheckOutOrderModel> createOrder(
      {required Map<String, dynamic> bodyJson}) async {
    String? accessToken = await cacheHelper.getData(key: CacheKey.accessToken);

    Map<String, dynamic> headers = {
      ApiKey.authorization: accessToken,
    };
    bool isLoggedIn = (accessToken != null) ? true : false;

    Map<String, dynamic> extra = {
      ApiKey.requiredAuth: true,
    };
    final response = await api.post(EndPoints.createOrder,
        headers: headers, extra: extra, data: bodyJson);
    return CheckOutOrderModel.fromJson(response);
  }

  String noInternectConnection() {
    return "NO Internet connection";
  }
}

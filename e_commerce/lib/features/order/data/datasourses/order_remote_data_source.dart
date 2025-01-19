import 'package:e_commerce/core/databases/api/api_consumer.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/databases/cache/secure_storage_helper.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/core/shared/data/models/message_model.dart';
import '../models/order_model.dart';

class OrderRemoteDataSource {
  final ApiConsumer api;
  final SecureStorageHelper cacheHelper;
  OrderRemoteDataSource({
    required this.api,
    required this.cacheHelper,
  });
//! get order:
  Future<OrderModel> getOrder() async {
    String? accessToken = await cacheHelper.getData(key: CacheKey.accessToken);

    Map<String, dynamic> headers = {
      ApiKey.authorization: accessToken,
    };
    bool isLoggedIn = (accessToken != null) ? true : false;

    Map<String, dynamic> extra = {
      ApiKey.requiredAuth: isLoggedIn,
    };
    final response =
        await api.get(EndPoints.getOrder, headers: headers, extra: extra);
    return OrderModel.fromJson(response);
  }

//!delete order:
  Future<MessageModel> deleteOrder(GetOrderIdParams params) async {
    String? accessToken = await cacheHelper.getData(key: CacheKey.accessToken);

    Map<String, dynamic> headers = {
      ApiKey.authorization: accessToken,
    };
    bool isLoggedIn = (accessToken != null) ? true : false;

    Map<String, dynamic> extra = {
      ApiKey.requiredAuth: true,
    };
    final response = await api.delete(EndPoints.deleteOrder(params),
        headers: headers, extra: extra);
    return MessageModel.fromJson(response);
  }

  String noInternectConnection() {
    return "NO Internet connection";
  }
}

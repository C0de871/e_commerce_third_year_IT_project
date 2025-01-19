import 'package:e_commerce/core/databases/api/api_consumer.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/databases/cache/secure_storage_helper.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/features/order_details/data/models/order_details_model.dart';
import 'package:e_commerce/features/order_details/domain/entites/order_details_entity/order_details_entity.dart';

class OrderDetailsRemoteDataSource {
  final ApiConsumer api;
  final SecureStorageHelper cacheHelper;

  OrderDetailsRemoteDataSource({required this.api, required this.cacheHelper});

//! get order details:
  Future<OrderDetailsEntity> getOrderDetails(GetOrderIdParams params) async {
    String? accessToken = await cacheHelper.getData(key: CacheKey.accessToken);

    Map<String, dynamic> headers = {
      ApiKey.authorization: accessToken,
    };
    bool isLoggedIn = (accessToken != null) ? true : false;

    Map<String, dynamic> extra = {
      ApiKey.requiredAuth: isLoggedIn,
    };
    final response =
        await api.get(EndPoints.getOrderDetails(params), headers: headers, extra: extra);
    return OrderDetailsModel.fromJson(response);
  }


  String noInternectConnection() {
    return "NO Internet connection";
  }
}

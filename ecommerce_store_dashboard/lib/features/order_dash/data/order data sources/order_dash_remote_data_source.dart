import 'package:ecommerce_store_dashboard/features/order_dash/data/model/order_model.dart';
import '../../../../core/databases/api/api_consumer.dart';
import '../../../../core/databases/api/end_points.dart';
import '../../../../core/databases/cache/secure_storage_helper.dart';

class OrderDashRemoteDataSource {
  final ApiConsumer api;
  final SecureStorageHelper cacheHelper;

  OrderDashRemoteDataSource({required this.api, required this.cacheHelper});
  Future<OrderModel> getOrderDash() async {
    Map<String, dynamic> headers = {
      ApiKey.authorization:
          await cacheHelper.getData(key: CacheKey.accessToken),
    };

    Map<String, dynamic> extra = {
      ApiKey.requiredAuth: true,
    };
    final response = await api.get(
      EndPoints.getOrder,
      headers: headers,
      extra: extra,
    );
    return OrderModel.fromJson(response);
  }
}

import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/order/data/models/sub_order_model.dart';
import 'package:e_commerce/features/order/domain/entites/order_entity.dart';

class OrderModel extends OrderEntity{
OrderModel({
    required super.orders
  }
);
factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orders: (json[ApiKey.orders] )
          ?.map((item) => SubOrderModel.fromJson(item ))
          .toList(),
    );
  }
}
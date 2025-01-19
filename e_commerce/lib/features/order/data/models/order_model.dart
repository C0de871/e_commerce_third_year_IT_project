import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/order/domain/entites/order_entity.dart';
import 'package:e_commerce/features/order/data/models/sub_order_model.dart';

class OrderModel extends OrderEntity {
  OrderModel({required super.data});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      data: (json[ApiKey.data] as List<dynamic>)
          .map((item) => SubOrderModel.fromJson(item))
          .toList(),
    );
  }
}

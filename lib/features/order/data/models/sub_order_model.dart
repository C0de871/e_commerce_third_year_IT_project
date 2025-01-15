import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/order/domain/entites/sub_order_entity.dart';

class SubOrderModel extends SubOrderEntity {
  SubOrderModel({
    required super.id,
    required super.numberOfProducts,
    required super.image,
    required super.orderDate,
    required super.orderReference,
    required super.status,
    required super.totalPrice
  }
);
factory SubOrderModel.fromJson(Map<String, dynamic> json) {
    return SubOrderModel(
      id: json[ApiKey.id],
      numberOfProducts:json[ApiKey.numberOfProducts],
      image: json[ApiKey.image],
      orderDate: json[ApiKey.orderDate],
      orderReference:json[ApiKey.orderReference],
      status:json[ApiKey.status],
      totalPrice:json[ApiKey.totalPrice], 
      );

}
}
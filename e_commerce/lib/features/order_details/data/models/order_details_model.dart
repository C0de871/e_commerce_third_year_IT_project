import 'package:e_commerce/features/order_details/data/models/data_order_model.dart';
import 'package:e_commerce/features/order_details/domain/entites/order_details_entity/order_details_entity.dart';

class OrderDetailsModel extends OrderDetailsEntity {
  OrderDetailsModel({
    required super.dataOrderEntity,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsModel(
      dataOrderEntity: json['data'] == null
          ? null
          : DataOrderModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}
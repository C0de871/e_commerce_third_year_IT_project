import 'package:e_commerce/features/order_details/data/models/product_order_model.dart';
import 'package:e_commerce/features/order_details/domain/entites/order_details_entity/data_order_entity.dart';

class DataOrderModel extends DataOrderEntity {
  DataOrderModel({
    required super.id,
    required super.productsOrderEntity,
    required super.status,
    required super.totalPrice,
    required super.userId,
  });

factory DataOrderModel.fromJson(Map<String, dynamic> json) {
  return DataOrderModel(
    id: json['id'] as int? ?? 0,
    userId: json['user_id'] as int? ?? 0,
    status: json['status'] as String? ?? 'Unknown',
    totalPrice: json['total_price'] is num
        ? (json['total_price'] as num).toDouble()
        : double.tryParse(json['total_price']?.toString() ?? '0.0') ?? 0.0,
    productsOrderEntity: (json['products'] as List<dynamic>? ?? [])
        .map((e) => ProductOrderModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}
}


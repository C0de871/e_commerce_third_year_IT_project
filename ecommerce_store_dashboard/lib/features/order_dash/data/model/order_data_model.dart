import 'package:ecommerce_store_dashboard/core/databases/api/end_points.dart';
import 'package:ecommerce_store_dashboard/features/order_dash/domain/entities/order/order_data_entity.dart';

class OrderDataModel extends OrderDataEntity {
  OrderDataModel(
      {required super.id,
      required super.status,
      required super.orderDate,
      required super.ownerOrder,
      required super.totalPrice,
      required super.numberOfProducts});

      factory OrderDataModel.fromJson(Map<String, dynamic> json) => OrderDataModel(
				id: json[ApiKey.id] as int,
				status: json[ApiKey.statusOrder] as String,
				orderDate: json[ApiKey.orderDate] as String,
				ownerOrder: json[ApiKey.ownerOrder] as String,
				totalPrice: json[ApiKey.totalPrice] as String,
				numberOfProducts: json[ApiKey.numberOfProducts] as int,
			);
}

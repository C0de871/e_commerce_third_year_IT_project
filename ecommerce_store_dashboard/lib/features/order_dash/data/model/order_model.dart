import 'package:ecommerce_store_dashboard/core/databases/api/end_points.dart';
import 'package:ecommerce_store_dashboard/features/order_dash/data/model/order_data_model.dart';
import 'package:ecommerce_store_dashboard/features/order_dash/domain/entities/order/order_entity.dart';

class OrderModel extends OrderEntity{
  OrderModel({required super.message, required super.data});

factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
				message: json[ApiKey.message] as String,
				data: (json[ApiKey.data] as List<dynamic>)
						.map((e) => OrderDataModel.fromJson(e as Map<String, dynamic>))
						.toList(),
			);


}
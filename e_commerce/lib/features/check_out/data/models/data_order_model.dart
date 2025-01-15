import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/check_out/data/models/check_out_order_model.dart';
import 'package:e_commerce/features/check_out/domain/entites/check_out_order/data_order_entity.dart';

class DataOrderModel extends DataOrderEntity {
  DataOrderModel({required super.orderCount});
  factory DataOrderModel.fromJson(Map<String, dynamic> json) => DataOrderModel(
        orderCount: json[ApiKey.orderCount],
      );
}

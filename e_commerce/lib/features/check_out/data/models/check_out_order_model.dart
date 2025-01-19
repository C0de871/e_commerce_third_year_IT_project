import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/check_out/domain/entites/check_out_order/check_out_order_entity.dart';

class CheckOutOrderModel extends CheckOutOrderEntity {
  CheckOutOrderModel({
    required super.message,
  });

  factory CheckOutOrderModel.fromJson(Map<String, dynamic> json) {
    return CheckOutOrderModel(message: json[ApiKey.message]);
  }
}

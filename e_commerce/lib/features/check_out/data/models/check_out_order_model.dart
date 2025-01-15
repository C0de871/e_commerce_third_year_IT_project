import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/check_out/data/models/data_order_model.dart';
import 'package:e_commerce/features/check_out/domain/entites/check_out_order/check_out_order_entity.dart';

class CheckOutOrderModel extends CheckOutOrderEntity{
CheckOutOrderModel({
required super.message,
required super.dataOrderEntity
});

factory CheckOutOrderModel.fromJson(Map<String, dynamic> json) {
    return CheckOutOrderModel(
      message: json[ApiKey.message],
      dataOrderEntity: json[ApiKey.data] != null
          ? DataOrderModel.fromJson(json[ApiKey.data] as Map<String, dynamic>)
          : null,
    );
  }
}
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/cart/domain/entites/size_cart_entity.dart';

class SizeCartModel extends SizeCartEntity{
SizeCartModel({required super.data});

factory SizeCartModel.fromJson(Map<String, dynamic> json) {
    return SizeCartModel(
      data:json[ApiKey.data] );
  }
}

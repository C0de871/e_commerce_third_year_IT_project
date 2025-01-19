import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/cart/data/models/sub_cart/sub_cart_model.dart';
import 'package:e_commerce/features/cart/domain/entites/cart_entity.dart';

class CartModel extends CartEntity {
  CartModel({required super.totalPrice, required super.data});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      totalPrice: (json[ApiKey.totalPrice] as num?)?.toDouble(),
      data: (json[ApiKey.data] as List<dynamic>?)
          ?.map((item) => SubCartModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

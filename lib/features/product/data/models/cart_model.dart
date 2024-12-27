import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/product/data/models/sub_cart/sub_cart_model.dart';
import 'package:e_commerce/features/product/domain/entites/cart_entity.dart';

class CartModel extends CartEntity {
CartModel({
  required super.totalPrice,
  required super.data
});

  
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      totalPrice: json['totalPrice'] , 
      data: (json['data'] )  
          ?.map((item) => SubCartModel.fromJson(item ))
          .toList(), 
    );
  }


}
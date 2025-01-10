import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/cart/domain/entites/add_to_cart_entity.dart';

class AddToCartModel extends AddToCartEntity{
AddToCartModel({required super.message});
factory AddToCartModel.fromJson(Map<String, dynamic> json) {
    return AddToCartModel(
      message: json[ApiKey.message],
    );
}
}
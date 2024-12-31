import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/cart/domain/entites/modify_cart/modify_cart.dart';

class ModifyCartModel extends ModifyCartEntity {

ModifyCartModel({required super.message,required super.cartAmount,required super.productId,required super.storeId});

factory ModifyCartModel.fromJson(Map<String, dynamic> json) {
    return ModifyCartModel(
      message: json[ApiKey.message],
      cartAmount:json[ApiKey.cartAmount],
      productId:json[ApiKey.productId],
      storeId:json[ApiKey.storeId]
    );
  }
ModifyCartEntity toEntity() {
    return ModifyCartEntity(
      productId: productId,
      storeId: storeId,
      cartAmount: cartAmount,
    );
  }
}

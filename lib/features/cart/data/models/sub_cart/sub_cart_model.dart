import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/cart/domain/entites/cart_entity/sub_cart_entity.dart';

class SubCartModel extends SubCartEntity {
  SubCartModel(
      {required super.storeId,
      required super.price,
      required super.orderQuantity,
      required super.quantity,
      required super.productId,
      required super.message,
      required super.mainImage,
      required super.productName,
      required super.storeProductId});
  factory SubCartModel.fromJson(Map<String, dynamic> json) => SubCartModel(
        storeId: json[ApiKey.storeId],
        price: json[ApiKey.price],
        quantity: json[ApiKey.quantity],
        productId: json[ApiKey.productId],
        message: json[ApiKey.message],
        mainImage: json[ApiKey.mainImage],
        productName: json[ApiKey.productName],
        orderQuantity: json[ApiKey.orderQuantity], 
        storeProductId: json[ApiKey.storeProductId],
      );
}

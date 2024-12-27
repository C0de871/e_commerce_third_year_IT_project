import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/product/domain/entites/cart_entity/sub_cart_entity.dart';

class SubCartModel extends SubCartEntity {
  SubCartModel({
    required super.storeId,
    required super.storeName,
    required super.orderQuantity,
    required super.storeProductId,
    required super.price,
    required super.quantity,
    required super.description,
    required super.productId,
    required super.productName,
    required super.mainImage,
    required super.message,
  });
  factory SubCartModel.fromJson(Map<String, dynamic> json) => SubCartModel(
        storeId: json[ApiKey.storeId],
        storeName: json[ApiKey.storeName],
        orderQuantity: json[ApiKey.orderQuantity],
        storeProductId: json[ApiKey.storeProductId],
        price: json[ApiKey.price],
        quantity: json[ApiKey.quantity],
        description: json[ApiKey.description],
        productId: json[ApiKey.productId],
        productName: json[ApiKey.productName],
        mainImage: json[ApiKey.mainImage],
        message: json[ApiKey.message],
      );
}

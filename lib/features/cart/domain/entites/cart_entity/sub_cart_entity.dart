import 'package:collection/collection.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';

class SubCartEntity {
  int? storeId;
  String? storeName;
  int? orderQuantity;
  int? storeProductId;
  String? price;
  int? quantity;
  String? description;
  int? productId;
  String? productName;
  String? mainImage;
  String? message;

  SubCartEntity({
    this.storeId,
    this.storeName,
    this.orderQuantity,
    this.storeProductId,
    this.price,
    this.quantity,
    this.description,
    this.productId,
    this.productName,
    this.mainImage,
    this.message,
  });

  factory SubCartEntity.fromJson(Map<String, dynamic> json) => SubCartEntity(
        storeId: json[ApiKey.storeId] as int?,
        storeName: json[ApiKey.storeName] as String?,
        orderQuantity: json[ApiKey.orderQuantity] as int?,
        storeProductId: json[ApiKey.storeProductId] as int?,
        price: json[ApiKey.price] as String?,
        quantity: json[ApiKey.quantity] as int?,
        description: json[ApiKey.description] as String?,
        productId: json[ApiKey.productId] as int?,
        productName: json[ApiKey.productName] as String?,
        mainImage: json[ApiKey.mainImage] as String?,
        message: json[ApiKey.message] as String?,
      );
SubCartEntity copyWith({
    int? storeId,
    String? storeName,
    int? orderQuantity,
    int? storeProductId,
    String? price,
    int? quantity,
    String? description,
    int? productId,
    String? productName,
    String? mainImage,
    String? message,
  }) {
    return SubCartEntity(
      storeId: storeId ?? this.storeId,
      storeName: storeName ?? this.storeName,
      orderQuantity: orderQuantity ?? this.orderQuantity,
      storeProductId: storeProductId ?? this.storeProductId,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      description: description ?? this.description,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      mainImage: mainImage ?? this.mainImage,
      message: message ?? this.message,
    );
  }

}

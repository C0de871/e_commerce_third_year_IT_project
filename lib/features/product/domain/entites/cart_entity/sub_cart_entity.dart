import 'package:collection/collection.dart';

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
}

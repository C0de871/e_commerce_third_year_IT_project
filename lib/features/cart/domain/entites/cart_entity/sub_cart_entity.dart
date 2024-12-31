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

class ProductEntity {
  int storeId;
  String storeName;
  int productId;
  String productName;
  String price;
  int quantity;
  String? description;
  String mainImageUrl;
  bool isFavorite;

  ProductEntity({
    required this.storeId,
    required this.storeName,
    required this.productId,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.description,
    required this.mainImageUrl,
    required this.isFavorite,
  });
}

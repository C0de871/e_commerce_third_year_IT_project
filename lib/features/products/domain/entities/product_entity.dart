class ProductEntity {
  final int? storeId;
  final String? storeName;
  final int? productId;
  final String? productName;
  final int? categoryId;
  final String? categoryName;
  final String? price;
  final int? quantity;
  final String? description;
  final int? isFavorite;
  final String? mainImageUrl;

  ProductEntity({
    this.storeId,
    this.storeName,
    this.productId,
    this.productName,
    this.categoryId,
    this.categoryName,
    this.price,
    this.quantity,
    this.description,
    this.isFavorite,
    this.mainImageUrl,
  });
}

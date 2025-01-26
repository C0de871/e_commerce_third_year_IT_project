class ProductEntity {
  final int storeId;
  final String storeName;
  final int productId;
  final String productName;
  final String mainImage;
  final String price;
  final int quantity;
  final String description;
  final int isFavorite;
  final int categoryId;
  final String categoryName;

  ProductEntity({
    required this.storeId,
    required this.storeName,
    required this.productId,
    required this.productName,
    required this.mainImage,
    required this.price,
    required this.quantity,
    required this.description,
    required this.isFavorite,
    required this.categoryId,
    required this.categoryName,
  });
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
class StoreProductEntity {
  int storeId;
  String storeName;
  int productId;
  String productName;
  String mainImage;
  String price;
  int quantity;
  String description;
  int isFavorite;
  int categoryId;
  String categoryName;
  StoreProductEntity({
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

// ignore_for_file: public_member_api_docs, sort_constructors_first
class FavProductEntity {
  int? storeId;
  String? storeName;
  int? productId;
  String? productName;
  int? categoryId;
  String? categoryName;
  String? price;
  int? quantity;
  String? description;
  int? isFavorite;
  String? mainImage;
  FavProductEntity({
    required this.storeId,
    required this.storeName,
    required this.productId,
    required this.productName,
    required this.categoryId,
    required this.categoryName,
    required this.price,
    required this.quantity,
    required this.description,
    required this.isFavorite,
    required this.mainImage,
  });
}

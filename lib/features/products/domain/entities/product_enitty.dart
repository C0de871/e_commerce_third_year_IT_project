// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductEntity {
  int storeId;
  String storeName;
  int productId;
  String productName;
  String price;
  int quantity;
  String? description;
  String mainImageUrl;
  int isFavorite;

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

  ProductEntity copyWith({
    int? storeId,
    String? storeName,
    int? productId,
    String? productName,
    String? price,
    int? quantity,
    String? description,
    String? mainImageUrl,
    int? isFavorite,
  }) {
    return ProductEntity(
      storeId: storeId ?? this.storeId,
      storeName: storeName ?? this.storeName,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      description: description ?? this.description,
      mainImageUrl: mainImageUrl ?? this.mainImageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

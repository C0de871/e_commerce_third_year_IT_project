import '../../../../../core/databases/api/end_points.dart';
import '../../../domain/entities/show_store_entities/products_entity.dart';

class ProductsModel extends ProductEntity {
  ProductsModel({
    required super.storeId,
    required super.storeName,
    required super.productId,
    required super.productName,
    required super.mainImage,
    required super.price,
    required super.quantity,
    required super.description,
    required super.isFavorite,
    required super.categoryId,
    required super.categoryName,
  });

  // Factory method to map from JSON
  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      storeId: map[ApiKey.storeId],
      storeName: map[ApiKey.storeName],
      productId: map[ApiKey.productId],
      productName: map[ApiKey.productName],
      mainImage: map[ApiKey.mainImage],
      price: map[ApiKey.price],
      quantity: map[ApiKey.quantity],
      description: map[ApiKey.description],
      isFavorite: map[ApiKey.isFavorite],
      categoryId: map[ApiKey.categoryId],
      categoryName: map[ApiKey.categoryName],
    );
  }
  // Method to copy the ProductModel with changes
  ProductsModel copyWith({
    int? storeId,
    String? storeName,
    int? productId,
    String? productName,
    String? mainImage,
    String? price,
    int? quantity,
    String? description,
    int? isFavorite,
    int? categoryId,
    String? categoryName,
  }) {
    return ProductsModel(
      storeId: storeId ?? this.storeId,
      storeName: storeName ?? this.storeName,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      mainImage: mainImage ?? this.mainImage,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
    );
  }
}

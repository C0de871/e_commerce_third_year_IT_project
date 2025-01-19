import 'package:e_commerce/features/get_store_details/domain/entities/show_store_entities/store_product_entity.dart';

import '../../../../../core/databases/api/end_points.dart';

class StoreProductModel extends StoreProductEntity {
  StoreProductModel({
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

  factory StoreProductModel.fromMap(Map<String, dynamic> data) =>
      StoreProductModel(
        storeId: data[ApiKey.storeId] as int,
        storeName: data[ApiKey.storeName] as String,
        productId: data[ApiKey.productId] as int,
        productName: data[ApiKey.productName] as String,
        mainImage: data[ApiKey.mainImage] as String,
        price: data[ApiKey.price] as String,
        quantity: data[ApiKey.quantity] as int,
        description: data[ApiKey.description] as String,
        isFavorite: data[ApiKey.isFavorite] as int,
        categoryId: data[ApiKey.categoryId] as int,
        categoryName: data[ApiKey.categoryName] as String,
      );

  Map<String, dynamic> toMap() => {
        ApiKey.storeId: storeId,
        ApiKey.storeName: storeName,
        ApiKey.productId: productId,
        ApiKey.productName: productName,
        ApiKey.mainImage: mainImage,
        ApiKey.price: price,
        ApiKey.quantity: quantity,
        ApiKey.description: description,
        ApiKey.isFavorite: isFavorite,
        ApiKey.categoryId: categoryId,
        ApiKey.categoryName: categoryName,
      };

  StoreProductModel copyWith({
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
    return StoreProductModel(
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

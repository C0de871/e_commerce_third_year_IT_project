import 'dart:convert';

import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/databases/api/end_points.dart';

class ProductModel extends ProductEntity with EquatableMixin {
  ProductModel({
    super.storeId,
    super.storeName,
    super.productId,
    super.productName,
    super.categoryId,
    super.categoryName,
    super.price,
    super.quantity,
    super.description,
    super.isFavorite,
    super.mainImageUrl,
  });

  factory ProductModel.fromMap(Map<String, dynamic> data) => ProductModel(
        storeId: data[ApiKey.storeId] as int?,
        storeName: data[ApiKey.storeName] as String?,
        productId: data[ApiKey.productId] as int?,
        productName: data[ApiKey.productName] as String?,
        categoryId: data[ApiKey.categoryId] as int?,
        categoryName: data[ApiKey.name] as String?,
        price: data[ApiKey.price] as String?,
        quantity: data[ApiKey.quantity] as int?,
        description: data[ApiKey.description] as String?,
        isFavorite: data[ApiKey.isFavorite] as int?,
        mainImageUrl: data[ApiKey.mainImageUrl] as String?,
      );

  Map<String, dynamic> toMap() => {
        ApiKey.storeId: storeId,
        ApiKey.storeName: storeName,
        ApiKey.productId: productId,
        ApiKey.productName: productName,
        ApiKey.categoryId: categoryId,
        ApiKey.name: categoryName,
        ApiKey.price: price,
        ApiKey.quantity: quantity,
        ApiKey.description: description,
        ApiKey.isFavorite: isFavorite,
        ApiKey.mainImageUrl: mainImageUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProductModel].
  factory ProductModel.fromJson(String data) {
    return ProductModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProductModel] to a JSON string.
  String toJson() => json.encode(toMap());

  ProductModel copyWith({
    int? storeId,
    String? storeName,
    int? productId,
    String? productName,
    int? categoryId,
    String? categoryName,
    String? price,
    int? quantity,
    String? description,
    int? isFavorite,
    String? mainImage,
  }) {
    return ProductModel(
      storeId: storeId ?? this.storeId,
      storeName: storeName ?? this.storeName,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
      mainImageUrl: mainImage ?? this.mainImageUrl,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      storeId,
      storeName,
      productId,
      productName,
      categoryId,
      categoryName,
      price,
      quantity,
      description,
      isFavorite,
      mainImageUrl,
    ];
  }
}

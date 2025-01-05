

import 'package:collection/collection.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';

import '../../../domain/entities/get_fav_list_entity/data_entity.dart';


class DataModel extends DataEntity{
 
  DataModel({
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
    super.mainImage,
  });

  factory DataModel.fromMap(Map<String, dynamic> data) => DataModel(
        storeId: data[ApiKey.storeId] as int?,
        storeName: data[ApiKey.storeName] as String?,
        productId: data[ApiKey.productId] as int?,
        productName: data[ApiKey.productName] as String?,
        categoryId: data[ApiKey.categoryId] as int?,
        categoryName: data[ApiKey.categoryName] as String?,
        price: data[ApiKey.price] as String?,
        quantity: data[ApiKey.quantity] as int?,
        description: data[ApiKey.description] as String?,
        isFavorite: data[ApiKey.isFavorite] as int?,
        mainImage: data[ApiKey.mainImage] as String?,
      );

  Map<String, dynamic> toMap() => {
        ApiKey.storeId: storeId,
        ApiKey.storeName: storeName,
        ApiKey.productId: productId,
        ApiKey.productName: productName,
        ApiKey.categoryId: categoryId,
        ApiKey.categoryName: categoryName,
        ApiKey.price: price,
        ApiKey.quantity: quantity,
        ApiKey.description: description,
        ApiKey.isFavorite: isFavorite,
        ApiKey.mainImage: mainImage,
      };

  DataModel copyWith({
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
    return DataModel(
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
      mainImage: mainImage ?? this.mainImage,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! DataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => storeId.hashCode ^ storeName.hashCode ^ productId.hashCode ^ productName.hashCode ^ categoryId.hashCode ^ categoryName.hashCode ^ price.hashCode ^ quantity.hashCode ^ description.hashCode ^ isFavorite.hashCode ^ mainImage.hashCode;
}

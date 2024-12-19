import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/Home%20common/products%20feature/domain/entities/product_enitty.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.storeId,
    required super.storeName,
    required super.productId,
    required super.productName,
    required super.price,
    required super.quantity,
    required super.description,
    required super.mainImageUrl,
    required super.isFavorite,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    //! the json we will recieve is a product json not data json!!
    return ProductModel(
      storeId: json[ApiKey.storeId],
      storeName: json[ApiKey.storeName],
      productId: json[ApiKey.productId],
      productName: json[ApiKey.productName],
      price: json[ApiKey.price],
      quantity: json[ApiKey.quantity],
      description: json[ApiKey.description],
      mainImageUrl: json[ApiKey.mainImageUrl],
      isFavorite: json[ApiKey.isFavorite],
    );
  }

  Map<String, dynamic> productToJson() {
    return {
      ApiKey.storeId: storeId,
      ApiKey.storeName: storeName,
      ApiKey.productId: productId,
      ApiKey.productName: productName,
      ApiKey.price: price,
      ApiKey.quantity: quantity,
      ApiKey.description: description,
      ApiKey.mainImageUrl: mainImageUrl,
      ApiKey.isFavorite: isFavorite,
    };
  }
}

import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/order_details/domain/entites/order_details_entity/product_order_entity.dart';

class ProductOrderModel extends ProductOrderEntity {
  ProductOrderModel({
    required super.categoryId,
    required super.categoryName,
    required super.description,
    required super.isFavorite,
    required super.mainImage,
    required super.price,
    required super.productId,
    required super.productName,
    required super.quantity,
    required super.storeId,
    required super.storeName,
  });
  factory ProductOrderModel.fromJson(Map<String, dynamic> json) {
  final productDetails = json['product_details'] as Map<String, dynamic>?;

  return ProductOrderModel(
    storeId: productDetails?['store_id'] as int? ?? 0,
    storeName: productDetails?['store_name'] as String? ?? 'Unknown Store',
    productId: productDetails?['product_id'] as int? ?? 0,
    productName: productDetails?['product_name'] as String? ?? 'Unknown Product',
    categoryId: productDetails?['category_id'] as int? ?? 0,
    categoryName: productDetails?['category_name'] as String? ?? 'Unknown Category',
    price: json['price'] is num
        ? (json['price'] as num).toDouble()
        : double.tryParse(json['price']?.toString() ?? '0.0') ?? 0.0,
    quantity: json['quantity'] as int? ?? 0,
    description: productDetails?['description'] as String? ?? 'No description',
    isFavorite: productDetails?['is_favorite'] as int? ?? 0,
    mainImage: productDetails?['main_image'] as String? ?? '',
  );
}

}

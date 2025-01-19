import 'package:e_commerce/core/databases/api/end_points.dart';

import 'cart_entity/sub_cart_entity.dart';

class CartEntity {
  final double? totalPrice;
  final List<SubCartEntity>? data;

  CartEntity({this.totalPrice, this.data});

  CartEntity copyWith({List<SubCartEntity>? data, double? totalPrice}) {
    return CartEntity(
      data: data ?? this.data,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      ApiKey.totalPrice: totalPrice,
      ApiKey.data: data?.map((item) => item.toMap()).toList(),
    };
  }
}

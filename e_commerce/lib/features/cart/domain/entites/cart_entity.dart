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
}
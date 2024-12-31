import 'package:collection/collection.dart';

import 'cart_entity/sub_cart_entity.dart';

class CartEntity {
  int? totalPrice;
  List<SubCartEntity>? data;

  CartEntity({this.totalPrice, this.data});

  CartEntity copyWith({List<SubCartEntity>? data}) {
    return CartEntity(
      data: data ?? this.data,
    );
  }
}

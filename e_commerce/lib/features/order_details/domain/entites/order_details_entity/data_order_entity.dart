import 'package:e_commerce/features/cart/data/models/cart.dart';
import 'package:e_commerce/features/order_details/domain/entites/order_details_entity/product_order_entity.dart';


class DataOrderEntity {
  int? id;
  int? userId;
  String? status;
  double? totalPrice;
  List<ProductOrderEntity>? productsOrderEntity;

  DataOrderEntity({this.id, this.userId, this.status, this.totalPrice, this.productsOrderEntity});
}

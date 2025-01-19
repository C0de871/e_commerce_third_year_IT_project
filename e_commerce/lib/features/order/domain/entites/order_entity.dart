import 'package:e_commerce/features/order/domain/entites/sub_order_entity.dart';

class OrderEntity {
  List<SubOrderEntity>? data;

  OrderEntity({
    List<SubOrderEntity>? data,
  }) : data = data ?? [];
}

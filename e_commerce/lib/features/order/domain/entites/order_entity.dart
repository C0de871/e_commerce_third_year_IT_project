import 'package:e_commerce/features/order/domain/entites/sub_order_entity.dart';

class OrderEntity {
  List<SubOrderEntity>? orders;
  OrderEntity({
    List<SubOrderEntity>? orders,
  }) : orders = orders ?? [];
}

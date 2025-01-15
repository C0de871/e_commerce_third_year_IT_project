import 'package:e_commerce/features/order/domain/entites/order_entity.dart';
import 'package:e_commerce/features/order/domain/entites/sub_order_entity.dart';
class GetOrderState {}
class GetOrderInitial extends GetOrderState{}
class GetOrderLoading extends GetOrderState{}
class GetOrderSuccess extends GetOrderState{
  final OrderEntity orders;
  GetOrderSuccess({required this.orders});
}
class GetOrderFailure extends GetOrderState{
  final String errmessage;

  GetOrderFailure({required this.errmessage});
}

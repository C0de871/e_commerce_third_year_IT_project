
import 'package:ecommerce_store_dashboard/features/order_dash/domain/entities/order/order_entity.dart';

class GetOrderDashState {}

class GetOrderDashInitial extends GetOrderDashState {}

class GetOrderDashLoading extends GetOrderDashState {}

class GetOrderDashSuccess extends GetOrderDashState {
  final OrderEntity orders;
  GetOrderDashSuccess({required this.orders});
}

class GetOrderDashFailure extends GetOrderDashState {
  final String errmessage;

  GetOrderDashFailure({required this.errmessage});
}

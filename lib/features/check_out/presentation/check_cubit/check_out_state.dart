import 'package:e_commerce/features/check_out/domain/entites/check_out_order/check_out_order_entity.dart';

class CheckOutState {}
class CheckOutInitial extends CheckOutState {}
class CheckOutLoading extends CheckOutState {}
class CheckOutFailure extends CheckOutState{
  final String errmessage="Failed to create orders.";
}
class CheckOutSuccess extends CheckOutState {
  final CheckOutOrderEntity checkOutOrderEntity;

  CheckOutSuccess({required this.checkOutOrderEntity});
}
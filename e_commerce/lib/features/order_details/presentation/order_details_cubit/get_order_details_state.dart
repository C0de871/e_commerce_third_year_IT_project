import 'package:e_commerce/core/shared/domain/entities/message_entety.dart';
import 'package:e_commerce/features/order_details/domain/entites/order_details_entity/order_details_entity.dart';

class GetOrderDetailsState {}

class GetOrderDetailsInitial extends GetOrderDetailsState {}

class GetOrderDetailsLoading extends GetOrderDetailsState {}

class GetOrderDetailsSuccess extends GetOrderDetailsState {
  final OrderDetailsEntity orderDetailsEntity;

  GetOrderDetailsSuccess({required this.orderDetailsEntity});
}

class GetOrderDetailsFailure extends GetOrderDetailsState {
  final String errmessage;

  GetOrderDetailsFailure({required this.errmessage});
}

import 'package:e_commerce/core/shared/domain/entities/message_entety.dart';

class DeleteOrderState {}

class DeleteOrderInitial extends DeleteOrderState {}

class DeleteOrderLoading extends DeleteOrderState {}

class DeleteOrderSuccess extends DeleteOrderState {
  final MessageEntity messageEntity;

  DeleteOrderSuccess({required this.messageEntity});
}

class DeleteOrderFailure extends DeleteOrderState {
  final String errmessage;

  DeleteOrderFailure({required this.errmessage});
}

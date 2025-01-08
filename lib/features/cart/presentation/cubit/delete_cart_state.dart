import 'package:e_commerce/core/shared/domain/entities/message_entety.dart';

class DeleteCartState {}

//! delete products:
class DeleteCartInitial extends DeleteCartState {}

class DeleteLoading extends DeleteCartState {}

class DeleteSuccess extends DeleteCartState {
  final MessageEntity messageEntity;
  DeleteSuccess({required this.messageEntity});
}

class DeleteFailure extends DeleteCartState {
  final String errMessage;
  DeleteFailure({required this.errMessage});
}

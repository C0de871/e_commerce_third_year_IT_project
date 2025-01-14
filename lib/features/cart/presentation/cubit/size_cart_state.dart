import 'package:e_commerce/features/cart/domain/entites/size_cart_entity.dart';

class SizeCartState {}
class SizeInitial extends SizeCartState {}

class SizeFailure extends SizeCartState {
  final String errMessage;

  SizeFailure({required this.errMessage});
}

class SizeSuccess extends SizeCartState {
  final SizeCartEntity sizeCartEntity;

  SizeSuccess({required this.sizeCartEntity});
}

class SizeLoading extends SizeCartState {}

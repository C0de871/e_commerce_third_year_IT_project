
import 'package:e_commerce/features/cart/domain/entites/add_to_cart_entity.dart';

class AddToCartState  {}
class AddtoCartInitial extends AddToCartState {}

class AddToCartLoading extends AddToCartState {}

class AddToCartSuccess extends AddToCartState {
  final AddToCartEntity addToCartEntity;
  AddToCartSuccess({required this.addToCartEntity});
}
class AddToCartFailure extends AddToCartState {
  final String errMessage;
  AddToCartFailure({required this.errMessage});
}


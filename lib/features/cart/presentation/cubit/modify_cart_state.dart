import 'package:e_commerce/features/cart/domain/entites/cart_entity.dart';

class ModifyCartState {}

//! modify cart state:
class ModifyCartInitial extends ModifyCartState{}

class ModifyLoading extends ModifyCartState {}

class ModifySuccess extends ModifyCartState {
  
    final CartEntity cart;

  ModifySuccess({required this.cart});

  ModifySuccess copyWith({CartEntity? cart}) {
    return ModifySuccess(
      cart: cart ?? this.cart,
    );
  }
  }

class ModifyFailure extends ModifyCartState {
  final String errMessage;

  ModifyFailure({required this.errMessage});
}

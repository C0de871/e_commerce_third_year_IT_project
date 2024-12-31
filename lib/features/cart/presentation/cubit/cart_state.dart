part of 'cart_cubit.dart';

class CartState {}


class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final CartEntity cart;

  CartSuccess({required this.cart});

  CartSuccess copyWith({CartEntity? cart}) {
    return CartSuccess(
      cart: cart ?? this.cart,
    );
  }
}

class CartFailure extends CartState {
  final String errMessage;
  CartFailure({required this.errMessage});
}

//! modify cart state:
class ModifyLoading extends CartState{}
class ModifySuccess extends CartState{
final List<ModifyCartEntity> modifiedProducts;

  ModifySuccess({required this.modifiedProducts});
}

class ModifyFailure extends CartState{
final String errMessage;

  ModifyFailure({required this.errMessage});

}
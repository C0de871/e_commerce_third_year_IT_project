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

//! clear:
class ClearFailure extends CartState {
  final String errMessage;

  ClearFailure({required this.errMessage});
}

class ClearSuccess extends CartState {
  final MessageEntity messageEntity;

  ClearSuccess({required this.messageEntity});
}

class ClearLoading extends CartState {}

import 'dart:async';
import 'dart:developer';

import 'package:e_commerce/core/shared/domain/entities/message_entety.dart';
import 'package:e_commerce/core/utils/services/service_locator.dart';
import 'package:e_commerce/features/cart/data/serevice/modify_cart_service.dart';
import 'package:e_commerce/features/cart/domain/entites/cart_entity.dart';
import 'package:e_commerce/features/cart/domain/entites/cart_entity/sub_cart_entity.dart';
import 'package:e_commerce/features/cart/domain/usecases/clear_cart.dart';
import 'package:e_commerce/features/cart/domain/usecases/get_cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  GetCart getCart;
  ClearCart clearCart;
  ModifyCartService modifyCartService;

  late StreamSubscription _modifySubscription;
  CartCubit()
      : getCart = getIt<GetCart>(),
        clearCart = getIt<ClearCart>(),
        modifyCartService = getIt<ModifyCartService>(),
        super(CartInitial()) {
    _listenToFavoriteUpdates();
  }

//! get cart:
  dynamic getCartTrigger() async {
    emit(CartLoading());

    final failureOrCartEntity = await getCart.call();
    failureOrCartEntity.fold(
      (failure) => emit(CartFailure(errMessage: failure.errMessage)),
      (cart) {
        emit(CartSuccess(cart: cart));
      },
    );
  }

  dynamic clearCartTrigger() async {
    emit(ClearLoading());

    final failureOrClearEntity = await clearCart.call();
    failureOrClearEntity
        .fold((failure) => emit(ClearFailure(errMessage: failure.errMessage)),
            (messageEntity) {
      print(
          "****************************************************************clearSuccess");
      emit(
        ClearSuccess(messageEntity: messageEntity),
      );
    });
  }

  void _listenToFavoriteUpdates() {
    _modifySubscription = modifyCartService.modifyUpdatesStream.listen((value) {
      if (state is CartSuccess) {
        double totalPrice = 0;
        final List<SubCartEntity> updatedList =
            (state as CartSuccess).cart.data!.map((subCartEntity) {
          if (subCartEntity.productId == value.productId &&
              subCartEntity.storeId == value.storeId) {
            totalPrice +=
                double.parse(subCartEntity.price!) * value.orderQuantity!;

            SubCartEntity sub =
                subCartEntity.copyWith(orderQuantity: value.orderQuantity);
            // print("subcart:${sub.quantity} ");
            return sub;
          }
          totalPrice +=
              double.parse(subCartEntity.price!) * subCartEntity.orderQuantity!;
          return subCartEntity;
        }).toList();

        CartEntity updatedCartEntity = (state as CartSuccess)
            .cart
            .copyWith(data: updatedList, totalPrice: totalPrice.round());
        // log("finally :");
        for (var x in updatedCartEntity.data!) {
          print("x value:${x.quantity}");
        }
        CartSuccess cart = CartSuccess(cart: updatedCartEntity);
        for (var y in cart.cart.data!) {
          print("y value:${y.quantity}");
        }
        print(updatedCartEntity.data);
        emit(cart);
      }
    });
  }

  @override
  Future<void> close() {
    log("cart closed");
    _modifySubscription.cancel();
    return super.close();
  }

  @override
  void onChange(Change<CartState> change) {
    print("current :${change.currentState}");
    print("next :${change.nextState}");
    print("is equal ${change.currentState == change.nextState}");
    super.onChange(change);
  }
}
// void confirmDelete() {
//   emit(state.copyWith(isItemDeleted: false));
// }

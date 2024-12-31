import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/utils/services/service_locator.dart';
import 'package:e_commerce/features/cart/data/models/cart.dart';
import 'package:e_commerce/features/cart/data/models/cart_model.dart';
import 'package:e_commerce/features/cart/domain/entites/cart_entity.dart';
import 'package:e_commerce/features/cart/domain/entites/cart_entity/sub_cart_entity.dart';
import 'package:e_commerce/features/cart/domain/entites/modify_cart/modify_cart.dart';
import 'package:e_commerce/features/cart/domain/usecases/get_cart.dart';
import 'package:e_commerce/features/user/data/models/cart.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  GetCart getCart;
final List<Map<String,dynamic>> modifiedItems = []; 
  CartCubit()
    : getCart = getIt<GetCart>(),
    super(CartInitial());


//! get cart:
dynamic getCartTrigger() async {
    emit(CartLoading());
    final failureOrCartEntity = await getCart.call();
    failureOrCartEntity.fold(
      (failure) => emit(CartFailure(errMessage: failure.errMessage)),
      (cart) => emit(
        CartSuccess(cart: cart),
      ),
    );
  }
  //! increment function:
  void increment(int productId, int storeId) {
    final updateSubCart = (state as CartSuccess).cart.data!.map((subCart) {
      if ((subCart.storeId == storeId) && (subCart.productId == productId)) {
final updatedItem = subCart.copyWith(quantity: (subCart.quantity ?? 0) +1);

        
        final modifiedItem = {
          ApiKey.productId: productId,
          ApiKey.storeId: storeId,
          ApiKey.quantity: updatedItem.quantity,
        };

        
        final existingIndex = modifiedItems.indexWhere(
          (item) => item[ApiKey.productId] == productId && item[ApiKey.storeId] == storeId,
        );

        if (existingIndex == -1) {
          modifiedItems.add(modifiedItem);
        } else {
          modifiedItems[existingIndex] = modifiedItem;
        }

        return updatedItem;
      }
      return subCart;
    }).toList();

    final updatedCart =
        (state as CartSuccess).cart.copyWith(data: updateSubCart);
    emit(CartSuccess(cart: updatedCart));
  }

//! decrement function:
  void decrement(int productId, int storeId) {
    final updateSubCart = (state as CartSuccess).cart.data!.map((subCart) {
      if ((subCart.storeId == storeId) &&
          (subCart.productId == productId) &&
          (subCart.quantity! > 1)) {
final updatedItem = subCart.copyWith(quantity: (subCart.quantity ?? 0) -1);

        final modifiedItem = {
          ApiKey.productId: productId,
          ApiKey.storeId: storeId,
          ApiKey.quantity: updatedItem.quantity,
        };

        
        final existingIndex = modifiedItems.indexWhere(
          (item) => item[ApiKey.productId] == productId && item[ApiKey.storeId] == storeId,
        );

        if (existingIndex == -1) {
          modifiedItems.add(modifiedItem);
        } else {
          modifiedItems[existingIndex] = modifiedItem;
        }

        return updatedItem;
      }
      return subCart;
    }).toList();

    final updatedCart =
        (state as CartSuccess).cart.copyWith(data: updateSubCart);
    emit(CartSuccess(cart: updatedCart));
  }

//! get Cart function:
Map<String, List<Map<String, dynamic>>> getModifiedItemsMap() {
    return {'data': modifiedItems};
  }
  // void confirmDelete() {
  //   emit(state.copyWith(isItemDeleted: false));
  // }
}

// import 'package:bloc/bloc.dart';
// import 'package:e_commerce/features/product/data/models/cart.dart';
// import 'package:meta/meta.dart';

// part 'cart_state.dart';

// class CartCubit extends Cubit<CartState> {
//   CartCubit()
//       : super(CartState(
//             cartItems: demoCarts, deletedItems: [], isItemDeleted: false));

//   void markItemForDeletion(ProductData product) {
//     final updatedCart = List<ProductData>.from(state.cartItems);
//     var deletedItem = updatedCart.removeAt(product);
//     deletedItem = deletedItem.add(product);
//     // final updatedDeletedItems = List<Cart>.from(state.deletedItems)..add(deletedItem);
    
//     // إصدار الحالة المحدثة
//     emit(state.copyWith(
//       cartItems: updatedCart,
//       deletedItems: updatedDeletedItems,
//       isItemDeleted: true,
//     ));
//   }

//   void confirmDelete() {
//     emit(state.copyWith(isItemDeleted: false));
//   }
// }

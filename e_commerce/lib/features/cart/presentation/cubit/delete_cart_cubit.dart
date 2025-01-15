import 'package:e_commerce/core/utils/services/service_locator.dart';
import 'package:e_commerce/features/cart/domain/usecases/delete_cart.dart';
import 'package:e_commerce/features/cart/presentation/cubit/delete_cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteCartCubit extends Cubit<DeleteCartState> {
  DeleteCart deleteCart;
  List<Map<String, dynamic>> deletedItems = [];

  DeleteCartCubit()
      : deleteCart = getIt<DeleteCart>(),
        super(DeleteCartInitial());

  dynamic deleteCartTrigger() async {
    emit(DeleteLoading());
    Map<String, dynamic> body = getDeletedItemsMap();
    final failureOrDeleteEntity = await deleteCart.call(bodyJson: body);
    failureOrDeleteEntity.fold(
      (failure) => emit(DeleteFailure(errMessage: failure.errMessage)),
      (messageEntity) => emit(
        DeleteSuccess(messageEntity: messageEntity),
      ),
    );
  }

  //!add to delete lit
  void addDeletedItem(int productId, int storeId) {
    deletedItems.add({
      "product_id": productId,
      "store_id": storeId,
    });
  }

  Map<String, List<Map<String, dynamic>>> getDeletedItemsMap() {
    return {'data': deletedItems};
  }
}

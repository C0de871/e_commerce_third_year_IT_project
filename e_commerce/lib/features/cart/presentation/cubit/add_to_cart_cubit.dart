import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/core/utils/services/service_locator.dart';
import 'package:e_commerce/features/cart/domain/usecases/add_to_cart.dart';
import 'package:e_commerce/features/cart/presentation/cubit/add_to_cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCart addToCart;

  AddToCartCubit()
      : addToCart = getIt<AddToCart>(),
        super(AddtoCartInitial());

  dynamic addToCartTrigger(
      {required String productID,
      required String storeID,
      required int orderQuantity}) async {
    GetStoredAndProductIdParams params =
        GetStoredAndProductIdParams(productID: productID, storeID: storeID);
    Map<String, dynamic> bodyJson = {ApiKey.quantity: orderQuantity};
    emit(AddToCartLoading());
    final failureOrAddedEntity =
        await addToCart.call(params: params, bodyJson: bodyJson);
    failureOrAddedEntity.fold(
      (failure) => emit(AddToCartFailure(errMessage: failure.errMessage)),
      (addToCartEntity) => emit(
        AddToCartSuccess(addToCartEntity: addToCartEntity),
      ),
    );
  }
}

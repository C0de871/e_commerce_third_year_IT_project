import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_store_dashboard/features/products/data/services/delete_product_service.dart';
import 'package:ecommerce_store_dashboard/features/products/domain/entities/show_store_entities/show_store_entity.dart';
import 'package:ecommerce_store_dashboard/features/products/domain/use_cases/show_store_use_case.dart';

import '../../../../core/databases/params/params.dart';
import '../../../../core/utils/services/service_locator.dart';

part 'show_store_state.dart';

class ShowStoreCubit extends Cubit<ShowStoreState> {
  final ShowStoreUseCase showStoreUseCase;
  final DeleteProductService streamService;
  StreamSubscription? _productDeleteSubscription;

  ShowStoreCubit()
      : showStoreUseCase = getIt(),
        streamService = getIt(),
        super(ShowStoreInitial()) {
    // Listen to product delete stream
    listentToProductsUpdates();
  }

  dynamic showStoreTrigger(int storeID) async {
    emit(ShowStoreLoading());

    ShowStoreParams params = ShowStoreParams(storeID: storeID);
    final response = await showStoreUseCase.call(params: params);

    response.fold((failure) {
      emit(ShowStoreFailed(msg: failure.errMessage));
    }, (data) {
      emit(ShowStoreSuccess(showStoreEntity: data));
    });
  }

  void listentToProductsUpdates() {
    _productDeleteSubscription = streamService.productDeleteStream.listen((event) {
      if (state is ShowStoreSuccess) {
        final currentState = state as ShowStoreSuccess;

        // Create a new list of products without the deleted product
        final updatedProducts = currentState.showStoreEntity.products.where((product) => product.productId != event.productId).toList();

        // Create a new ShowStoreEntity with updated products
        final updatedStoreEntity = ShowStoreEntity(
          id: currentState.showStoreEntity.id,
          manager: currentState.showStoreEntity.manager,
          email: currentState.showStoreEntity.email,
          phoneNumber: currentState.showStoreEntity.phoneNumber,
          name: currentState.showStoreEntity.name,
          imageUrl: currentState.showStoreEntity.imageUrl,
          location: currentState.showStoreEntity.location,
          description: currentState.showStoreEntity.description,
          products: updatedProducts,
        );

        // Emit updated state
        emit(ShowStoreSuccess(showStoreEntity: updatedStoreEntity));
      }
    });
  }

  @override
  Future<void> close() {
    _productDeleteSubscription?.cancel();
    return super.close();
  }
}

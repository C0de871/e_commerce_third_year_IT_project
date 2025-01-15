import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/core/utils/services/service_locator.dart';
import 'package:e_commerce/features/get_store_details/domain/entities/show_store_entities/show_store_entity.dart';
import 'package:e_commerce/features/get_store_details/domain/usecases/get_store_details.dart';

import '../../../favorites/domain/service/product_favorite_service.dart';
import '../../data/models/show_store_model/store_product_model.dart';

part 'show_store_cubit_state.dart';

class ShowStoreCubit extends Cubit<ShowStoreState> {
  GetStoreDetails getStoreDetailsUseCase;
  final ProductFavoriteService _favoriteService;
  late StreamSubscription _favoriteSubscription;

  ShowStoreCubit()
      : _favoriteService = getIt<ProductFavoriteService>(),
        getStoreDetailsUseCase = getIt(),
        super(ShowStoreInitial()) {
    _listenToFavoriteUpdates();
  }

  void showStoreTrigger({required String storeID}) async {
    final params = ShowStoreParams(storeID: storeID);

    emit(ShowStoreLoading());
    log("show store trigger ");
    final response = await getStoreDetailsUseCase.call(params: params);

    response.fold(
      (failure) {
        emit(ShowStoreFailed(errMsg: failure.errMessage));
      },
      (storeDetails) {
        emit(ShowStoreSuccess(storeDetails: storeDetails));
      },
    );
  }

  void _listenToFavoriteUpdates() {
    _favoriteSubscription = _favoriteService.favoriteUpdatesStream.listen(
      (update) {
        if (state is ShowStoreSuccess) {
          var products = (state as ShowStoreSuccess).storeDetails.data[0].products;
          // log("in  the get fav list cubit: ${update.isFavorite}");

          for (var i = 0; i < products.length; i++) {
            var product = products[i];
            if (product.storeId.toString() == update.storeID && product.productId.toString() == update.productId) {
              // log("product found in fav list");
              products[i] = (product as StoreProductModel).copyWith(isFavorite: update.isFavorite);
            }
          }
          emit(((state as ShowStoreSuccess).copyWith()));
          // emit(GetFavListFailure(errMsg: "errMsg"));
        }
      },
    );
  }

  @override
  Future<void> close() {
    _favoriteSubscription.cancel();
    return super.close();
  }
}

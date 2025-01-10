import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/favorites/data/models/get_fav_list_model/fav_product_model.dart';
import 'package:e_commerce/features/favorites/domain/entities/get_fav_list_entity/fav_product_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/utils/services/service_locator.dart';
import '../../../domain/entities/get_fav_list_entity/get_fav_list_entity.dart';
import '../../../domain/service/product_favorite_service.dart';
import '../../../domain/usecases/get_fav_list.dart';

part 'get_fav_list_state.dart';

class GetFavListCubit extends Cubit<GetFavListState> {
  final GetFavList getFavListUseCase;
  final ProductFavoriteService _favoriteService;
  late StreamSubscription _favoriteSubscription;
  GetFavListCubit._()
      : _favoriteService = getIt<ProductFavoriteService>(),
        getFavListUseCase = getIt(),
        super(GetFavListInitial()) {
    _listenToFavoriteUpdates();
  }

  static GetFavListCubit? _instance = GetFavListCubit._();
  static GetFavListCubit get instance {
    if (_instance == null || _instance!.isClosed) {
      _instance = null;
      _instance = GetFavListCubit._();
    }
    _instance!.stream.listen((_) {}, onDone: () {
      _instance = null;
    });
    return _instance!;
  }

  Future<void> getFavList() async {
    emit(GetFavListLoading());

    final response = await getFavListUseCase.call();

    response.fold(
      (failure) => emit(
        GetFavListFailure(
          errMsg: failure.errMessage,
        ),
      ),
      (getFavListEntity) => emit(
        GetFavListSuccess(
          getFavListEntity: getFavListEntity,
        ),
      ),
    );
  }

  //! listen to favorite update:
  void _listenToFavoriteUpdates() {
    _favoriteSubscription = _favoriteService.favoriteUpdatesStream.listen(
      (update) {
        if (state is GetFavListSuccess) {
          var products = (state as GetFavListSuccess).getFavListEntity.data!;
          log("in  the get fav list cubit: ${update.isFavorite}");

          for (var i = 0; i < products.length; i++) {
            var product = products[i];
            if (product.storeId.toString() == update.storeID && product.productId.toString() == update.productId) {
              // Directly update the isFavorite property in the product
              log("product found in fav list");
              products[i] = (product as FavProductModel).copyWith(isFavorite: update.isFavorite);
            }
          }
          products = (state as GetFavListSuccess).getFavListEntity.data!;
          for (var i = 0; i < products.length; i++) {
            var product = products[i];
            if (product.storeId.toString() == update.storeID && product.productId.toString() == update.productId) {
              log("product found in fav list ${product.isFavorite}");
            }
          }
          emit(((state as GetFavListSuccess).copyWith()));
          // emit(GetFavListFailure(errMsg: "errMsg"));
        }
      },
    );
  }

  @override
  void onChange(Change<GetFavListState> change) {
    super.onChange(change);
    log("is equal: ${change.currentState == change.nextState}");
  }

  @override
  Future<void> close() {
    _favoriteSubscription.cancel();
    return super.close();
  }
}

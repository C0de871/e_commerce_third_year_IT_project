import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/databases/params/params.dart';
import '../../../../core/utils/services/service_locator.dart';
import '../../domain/entities/toggle_fav_entitiy.dart';
import '../../domain/service/product_favorite_service.dart';
import '../../domain/usecases/togge_fav_off.dart';
import '../../domain/usecases/toggle_fav_on.dart';

part 'toggle_fav_state.dart';

class ToggleFavCubit extends Cubit<ToggleFavOnState> {
  ToggleFavOn toggleFavOnUseCase;
  ToggleFavOff toggleFavOffUseCase;
  final ProductFavoriteService _favoriteService;
  ToggleFavCubit()
      :toggleFavOffUseCase=getIt<ToggleFavOff>(), toggleFavOnUseCase = getIt<ToggleFavOn>(),
        _favoriteService = getIt(),
        super(ToggleFavInitial());

  //!toggle fav on trigger:
  toggleFavOnTrigger({required int storeID, required int productID}) async {
    ToggleFavParams params = ToggleFavParams(
      productID: productID.toString(),
      storeID: storeID.toString(),
    );
    _favoriteService.updateProductFavoriteStatus(isFavorite: 1, params: params);
    emit(ToggleFavLoading());
    final response = await toggleFavOnUseCase.call(params: params);
    response.fold(
      (failure) {
        _favoriteService.updateProductFavoriteStatus(isFavorite: 0, params: params);
        log("failed");
        emit(ToggleFavFailure(msg: failure.errMessage));
      },
      (toggleFavOnEntity) {
        emit(ToggleFavSuccess(toggleFavOnEntity: toggleFavOnEntity));
      },
    );
  }

  //!toggle fav off trigger:
  toggleFavOffTrigger({required int storeID, required int productID}) async {
    ToggleFavParams params = ToggleFavParams(
      productID: productID.toString(),
      storeID: storeID.toString(),
    );
    _favoriteService.updateProductFavoriteStatus(isFavorite: 0, params: params);
    emit(ToggleFavLoading());
    final response = await toggleFavOffUseCase.call(params: params);
    response.fold(
      (failure) {
        _favoriteService.updateProductFavoriteStatus(isFavorite: 1, params: params);
        log("failed");
        emit(ToggleFavFailure(msg: failure.errMessage));
      },
      (toggleFavOnEntity) {
        emit(ToggleFavSuccess(toggleFavOnEntity: toggleFavOnEntity));
      },
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  ToggleFavCubit._()
      : toggleFavOffUseCase = getIt<ToggleFavOff>(),
        toggleFavOnUseCase = getIt<ToggleFavOn>(),
        _favoriteService = getIt(),
        super(ToggleFavInitial());

  static ToggleFavCubit? _instance = ToggleFavCubit._();
  static ToggleFavCubit get instance {
    if (_instance == null || _instance!.isClosed) {
      _instance = null;
      _instance = ToggleFavCubit._();
      log("inital cubit");
    }
    _instance!.stream.listen((_) {}, onDone: () {
      _instance = null;
      log("close the cubit");
    });
    return _instance!;
  }

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
        _favoriteService.updateProductFavoriteStatus(
            isFavorite: 0, params: params);
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
        _favoriteService.updateProductFavoriteStatus(
            isFavorite: 1, params: params);
        log("failed");
        emit(ToggleFavFailure(msg: failure.errMessage));
      },
      (toggleFavOnEntity) {
        emit(ToggleFavSuccess(toggleFavOnEntity: toggleFavOnEntity));
      },
    );
  }

  @override
  Future<void> close() {
    log("the fav cubit is closed");
    return super.close();
  }
}

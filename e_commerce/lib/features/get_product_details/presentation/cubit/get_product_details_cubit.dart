import 'dart:async';
import 'dart:developer';

import 'package:e_commerce/core/utils/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/databases/params/params.dart';
import '../../../favorites/domain/service/product_favorite_service.dart';
import '../../domain/entities/get_product_details_entity.dart';
import '../../domain/use_cases/get_product_details_use_case.dart';

part 'get_product_details_state.dart';

class GetProductDetailsCubit extends Cubit<GetProductDetailsState> {
  GetProductDetails getProductDetailsUseCase;

  final ProductFavoriteService _favoriteService;
  late StreamSubscription _favoriteSubscription;
  GetProductDetailsCubit._()
      : _favoriteService = getIt<ProductFavoriteService>(),
        getProductDetailsUseCase = getIt(),
        super(GetProductDetailsInitial()) {
    _listenToFavoriteUpdates();
  }

  static GetProductDetailsCubit? _instance = GetProductDetailsCubit._();

  static GetProductDetailsCubit get instance {
    if (_instance == null || _instance!.isClosed) {
      _instance = null;
      _instance = GetProductDetailsCubit._();
      log("inital cubit");
    }
    _instance!.stream.listen((_) {}, onDone: () {
      _instance = null;
      log("close the cubit");
    });
    return _instance!;
  }

  dynamic getProductDetailsTrigger({required String productID, required String storeID}) async {
    GetProductDetailsParams params = GetProductDetailsParams(
      productID: productID,
      storeID: storeID,
    );

    emit(GetProductDetailsLoading());
    final response = await getProductDetailsUseCase.call(params: params);
    response.fold(
      (failure) => emit(GetProductDetailsFailed(msg: failure.errMessage)),
      (getProductDetails) => emit(
        GetProductDetailsSuccess(productDetailsEntity: getProductDetails),
      ),
    );
  }

  dynamic increase() {
    GetProductDetailsEntity entity;
    if (state is GetProductDetailsSuccess) {
      log("increase");
      entity = (state as GetProductDetailsSuccess).productDetailsEntity;
      if (entity.data?.quantityInCart != null) {
        entity.data!.quantityInCart = entity.data!.quantityInCart! + 1;
      }
      log("${entity.data!.quantityInCart}");
      emit(
        GetProductDetailsSuccess(productDetailsEntity: entity),
      );
    }
  }

  dynamic decrease() {
    log("Hi");
    GetProductDetailsEntity entity;
    if (state is GetProductDetailsSuccess) {
      entity = (state as GetProductDetailsSuccess).productDetailsEntity;
      if (entity.data?.quantityInCart != null &&( entity.data?.quantityInCart! !=0)) {
        entity.data!.quantityInCart = entity.data!.quantityInCart! - 1;
      }
      // log(en)
      emit(
        GetProductDetailsSuccess(productDetailsEntity: entity),
      );
    }
  }

  //! listen to favorite update:
  void _listenToFavoriteUpdates() {
    _favoriteSubscription = _favoriteService.favoriteUpdatesStream.listen((update) {
      log("here is stream ${update.isFavorite}");
      (state as GetProductDetailsSuccess).productDetailsEntity.data!.isFavorite = update.isFavorite;
      emit((state as GetProductDetailsSuccess).copyWith());
    });
  }

  @override
  Future<void> close() {
    _favoriteSubscription.cancel();
    return super.close();
  }
}

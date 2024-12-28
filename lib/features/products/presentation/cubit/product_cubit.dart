// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/core/utils/services/service_locator.dart';
import 'package:e_commerce/features/products/domain/use%20cases/get_all_products.dart';
import 'package:meta/meta.dart';

import 'package:e_commerce/features/products/domain/entities/product_enitty.dart';

import '../../../favorites/domain/service/product_favorite_service.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  //!initialize cubit:
  GetAllProducts getAllProductsUseCase;
  final ProductFavoriteService _favoriteService;
  late StreamSubscription _favoriteSubscription;

  ProductCubit()
      : _favoriteService = getIt<ProductFavoriteService>(),
        getAllProductsUseCase = getIt<GetAllProducts>(),
        super(ProductInitial()) {
    _listenToFavoriteUpdates();
  }

  //! get all products:
  dynamic getAllProducts({int page = 1}) async {
    emit(GetAllProductsLoading());
    final response = await getAllProductsUseCase.call(params: ProductParams(page: page));
    response.fold(
      (failure) => emit(GetAllProductsFailed(errMessage: failure.errMessage)),
      (productsList) => emit(GetAllProductsSuccess(productsList: productsList)),
    );
  }

  //! listen to favorite update:
  void _listenToFavoriteUpdates() {                
    _favoriteSubscription = _favoriteService.favoriteUpdates.listen((update) {
      log("here is stream ${update.isFavorite}");
      final updateProducts = (state as GetAllProductsSuccess).productsList.map((product) {
        if ((product.storeId.toString() == update.storeID) && (product.productId.toString() == update.productId)) {
          return product.copyWith(isFavorite: update.isFavorite);
        }
        return product;
      }).toList();
      emit((state as GetAllProductsSuccess).copyWith(productsList: updateProducts));
    });
  }

  @override
  Future<void> close() {
    _favoriteSubscription.cancel();
    return super.close();
  }
}

// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/core/utils/services/service_locator.dart';
import 'package:e_commerce/features/products/data/models/product_model.dart';
import 'package:e_commerce/features/products/domain/entities/get_all_products_entity.dart';
import 'package:e_commerce/features/products/domain/use%20cases/get_all_products.dart';
import 'package:meta/meta.dart';

import '../../../../favorites/domain/service/product_favorite_service.dart';

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
  dynamic getAllProducts({bool isFirstPage = false, int page = 1, String query=""}) async {
    if (state is! ProductInitial) return;

    emit(GetAllProductsLoading());
    final response = await getAllProductsUseCase.call(params: ProductParams(page: page, query: query));
    response.fold(
      (failure) => emit(GetAllProductsFailed(errMessage: failure.errMessage)),
      (getAllProductsEntity) {
        emit(
          GetAllProductsSuccess(getAllProductsEntity: getAllProductsEntity),
        );
      },
    );
  }

  void reset() {
    emit(ProductInitial());
  }

  //! listen to favorite update:
  void _listenToFavoriteUpdates() {
    _favoriteSubscription = _favoriteService.favoriteUpdates.listen((update) {
      log("here is stream ${update.isFavorite}");
      if (state is GetAllProductsSuccess) {
        final products = (state as GetAllProductsSuccess).getAllProductsEntity.data!.products!;
        for (var i = 0; i < products.length; i++) {
          var product = products[i];
          if (product.storeId.toString() == update.storeID && product.productId.toString() == update.productId) {
            log("is product fav: ${product.isFavorite}");

            // Directly update the isFavorite property in the product
            products[i] = (product as ProductModel).copyWith(isFavorite: update.isFavorite);

            log("Updated is product fav: ${products[i].isFavorite}");
          }
        }
        emit((state as GetAllProductsSuccess).copyWith());
      }
    });
  }

  @override
  Future<void> close() {
    _favoriteSubscription.cancel();
    log("product cubit closed");
    return super.close();
  }
}

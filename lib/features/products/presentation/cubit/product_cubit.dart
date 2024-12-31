// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/core/utils/services/service_locator.dart';
import 'package:e_commerce/features/products/domain/use%20cases/get_all_products.dart';
import 'package:meta/meta.dart';

import 'package:e_commerce/features/products/domain/entities/product_enitty.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  //!initialize cubit:
  GetAllProducts getAllProductsUseCase;
  ProductCubit()
      : getAllProductsUseCase = getIt<GetAllProducts>(),
        super(ProductInitial());

  //! get all products:
  dynamic getAllProducts({int page = 1}) async {
    emit(GetAllProductsLoading());
    final response =
        await getAllProductsUseCase.call(params: ProductParams(page: page));
    response.fold(
      (failure) => emit(GetAllProductsFailed(errMessage: failure.errMessage)),
      (productsList) => emit(GetAllProductsSuccess(productsList: productsList)),
    );
  }
}

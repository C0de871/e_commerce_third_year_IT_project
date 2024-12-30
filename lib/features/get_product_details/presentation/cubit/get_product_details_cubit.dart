import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/utils/services/service_locator.dart';
import 'package:meta/meta.dart';

import '../../../../core/databases/params/params.dart';
import '../../domain/entities/get_product_details_entity.dart';
import '../../domain/use_cases/get_product_details_use_case.dart';

part 'get_product_details_state.dart';

class GetProductDetailsCubit extends Cubit<GetProductDetailsState> {
  GetProductDetails getProductDetailsUseCase;

  GetProductDetailsCubit()
      : getProductDetailsUseCase = getIt(),
        super(GetProductDetailsInitial());

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
}

import 'package:bloc/bloc.dart';
import 'package:ecommerce_store_dashboard/features/products/data/services/delete_product_service.dart';
import 'package:ecommerce_store_dashboard/features/products/domain/entities/delete_product_entity/delete_product_entity.dart';
import 'package:ecommerce_store_dashboard/features/products/domain/use_cases/delete_product_use_case.dart';

import '../../../../core/databases/params/params.dart';
import '../../../../core/utils/services/service_locator.dart';

part 'delete_product_state.dart';

class DeleteProductCubit extends Cubit<DeleteProductState> {
  final DeleteProductUseCase deleteProductUseCase;
  final DeleteProductService streamService;

  DeleteProductCubit()
      : deleteProductUseCase = getIt(),
        streamService = getIt(),
        super(DeleteProductInitial());


  Future<void> deleteProductTrigger(int storeID, int productID) async {
    emit(DeleteProductLoading());
    DeleteProductParams params = DeleteProductParams(storeID: storeID, productID: productID);

    final response = await deleteProductUseCase.call(params: params);

    response.fold((failure) {
      emit(DeleteProductFailed(errMsg: failure.errMessage));
    }, (data) {
      // Notify stream service about product deletion
      streamService.notifyProductDelete(storeID, productID);
      emit(DeleteProductSuccess(deleteProductEntity: data));
    });
  }
}

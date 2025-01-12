import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/core/utils/services/service_locator.dart';
import 'package:e_commerce/features/get_store_details/domain/entities/show_store_entities/show_store_entity.dart';
import 'package:e_commerce/features/get_store_details/domain/usecases/get_store_details.dart';

part 'show_store_cubit_state.dart';

class ShowStoreCubit extends Cubit<ShowStoreState> {
  GetStoreDetails getStoreDetailsUseCase;

  ShowStoreCubit()
      : getStoreDetailsUseCase = getIt(),
        super(ShowStoreInitial());

  void showStoreTrigger({required String storeID}) async {
    final params = ShowStoreParams(storeID: storeID);

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
}

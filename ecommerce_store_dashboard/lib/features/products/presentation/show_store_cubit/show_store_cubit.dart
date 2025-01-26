import 'package:bloc/bloc.dart';
import 'package:ecommerce_store_dashboard/core/databases/params/params.dart';
import 'package:ecommerce_store_dashboard/features/products/domain/entities/show_store_entities/show_store_entity.dart';
import 'package:ecommerce_store_dashboard/features/products/domain/use_cases/show_store_use_case.dart';

import '../../../../core/utils/services/service_locator.dart';

part 'show_store_state.dart';

class ShowStoreCubit extends Cubit<ShowStoreState> {
  ShowStoreUseCase showStoreUseCase;

  ShowStoreCubit()
      : showStoreUseCase = getIt(),
        super(ShowStoreInitial());

  dynamic showStoreTrigger(int storeID) async {
    emit(ShowStoreLoading());

    ShowStoreParams params = ShowStoreParams(storeID: storeID);
    final response = await showStoreUseCase.call(params: params);

    response.fold((failure) {
      emit(ShowStoreFailed(msg: failure.errMessage));
    }, (data) {
      emit(ShowStoreSuccess(showStoreEntity: data));
    });
  }
}

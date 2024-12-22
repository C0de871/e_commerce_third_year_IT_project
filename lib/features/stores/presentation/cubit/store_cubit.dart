import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/features/stores/domain/entities/git_stores_entity.dart';

import '../../../../core/utils/services/service_locator.dart';
import '../../domain/use cases/get_all_stores.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  GetAllStores getAllStoresUseCase;

  StoreCubit()
      : getAllStoresUseCase = getIt(),
        super(StoreInitial());

  dynamic getAllStores({int page = 1}) async {
    emit(GetAllStoresLoading());
    final response = await getAllStoresUseCase.call(params: StoreParams(page: 1));
    response.fold(
      (failure) => emit(
        GetAllStoresFailed(errMes: failure.errMessage),
      ),
      (storesList)=>emit(GetAllStoresSuccess(storesList: storesList))
    );
  }
}

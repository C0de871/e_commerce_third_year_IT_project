import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/utils/services/service_locator.dart';
import '../../../domain/entities/get_fav_list_entity/get_fav_list_entity.dart';
import '../../../domain/usecases/get_fav_list.dart';

part 'get_fav_list_state.dart';

class GetFavListCubit extends Cubit<GetFavListState> {
  final GetFavList getFavListUseCase;

  GetFavListCubit()
      : getFavListUseCase = getIt(),
        super(GetFavListInitial());

  Future<void> getFavList() async {
    emit(GetFavListLoading());

    final response = await getFavListUseCase.call();

    response.fold(
      (failure) => emit(
        GetFavListFailure(
          errMsg: failure.errMessage,
        ),
      ),
      (getFavListEntity) => emit(
        GetFavListSuccess(
          getFavListEntity: getFavListEntity,
        ),
      ),
    );
  }
}

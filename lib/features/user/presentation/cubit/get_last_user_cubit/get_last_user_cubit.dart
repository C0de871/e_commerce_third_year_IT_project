import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/utils/services/service_locator.dart';
import 'package:e_commerce/features/user/domain/entites/user_entities/user_entities.dart';
import 'package:e_commerce/features/user/domain/usecases/get_last_user.dart';
import 'package:equatable/equatable.dart';

part 'get_last_user_state.dart';

class GetLastUserCubit extends Cubit<GetLastUserState> {
  GetLastUser getLastUserUseCase;
  GetLastUserCubit()
      : getLastUserUseCase = getIt(),
        super(GetLastUserInitial());

  Future<void> getLastUser() async {
    emit(UserLoading());
    final response = await getLastUserUseCase.call();
    response.fold((failure) {
      emit(FaildToLoad(errMsg: failure.errMessage));
    }, (userOrNull) {
      if (userOrNull != null) {
        emit(UserLoaded(user: userOrNull));
      } else {
        emit(NoUserFound());
      }
    });
  }
}

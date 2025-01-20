import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/services/service_locator.dart';
import '../../domain/entities/get_users_entity/get_users_entity.dart';
import '../../domain/use_cases/get_users_use_case.dart';

part 'get_users_state.dart';

class GetUsersCubit extends Cubit<GetUsersState> {
  GetUsers getUsersUseCase;
  GetUsersCubit()
      : getUsersUseCase = getIt(),
        super(GetUsersInitial());

  getUsersTrigger()async{
    emit(GetUsersLoading());
    final response = await getUsersUseCase.call();
    response.fold(
      (failure) => emit(GetUsersFailed(errMsg: failure.errMessage)),
      (getUsersEntity) {
        emit(
          GetUsersSuccess(usersList: getUsersEntity),
        );
      },
    );
  }
}

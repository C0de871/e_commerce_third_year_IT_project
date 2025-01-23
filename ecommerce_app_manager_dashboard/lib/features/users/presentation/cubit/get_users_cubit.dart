import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/services/service_locator.dart';
import '../../data/services/role_update_service.dart';
import '../../domain/entities/get_users_entity/data_entity.dart';
import '../../domain/entities/get_users_entity/get_users_entity.dart';
import '../../domain/use_cases/get_users_use_case.dart';

part 'get_users_state.dart';

class GetUsersCubit extends Cubit<UsersState> {
  GetUsers getUsersUseCase;
  StreamSubscription<RoleUpdate>? _roleUpdateSubscription;

  GetUsersCubit()
      : getUsersUseCase = getIt(),
        super(GetUsersInitial()) {
    _roleUpdateSubscription = RoleUpdateService.roleUpdates.listen(_handleRoleUpdate);
  }

  getUsersTrigger() async {
    emit(GetUsersLoading());
    final response = await getUsersUseCase.call();
    response.fold(
      (failure) => emit(GetUsersFailed(errMsg: failure.errMessage)),
      (getUsersEntity) {
        emit(GetUsersSuccess(usersList: getUsersEntity));
      },
    );
  }

  void _handleRoleUpdate(RoleUpdate update) {
    if (state is GetUsersSuccess) {
      final currentState = state as GetUsersSuccess;
      final updatedUsers = currentState.usersList.data.map((user) {
        if (user.id == update.userId) {
          return DataEntity(
            id: user.id,
            firstName: user.firstName,
            lastName: user.lastName,
            email: user.email,
            location: user.location,
            phoneNumber: user.phoneNumber,
            imageUrl: user.imageUrl,
            role: update.newRole,
          );
        }
        return user;
      }).toList();

      final updatedUsersList = GetUsersEntity(
        successful: currentState.usersList.successful,
        data: updatedUsers,
        statusCode: currentState.usersList.statusCode,
      );

      emit(GetUsersSuccess(usersList: updatedUsersList));
    }
  }

  @override
  Future<void> close() {
    _roleUpdateSubscription?.cancel();
    return super.close();
  }
}

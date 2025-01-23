import 'package:bloc/bloc.dart';

import '../../../../core/utils/services/service_locator.dart';
import '../../data/services/role_update_service.dart';
import '../../domain/use_cases/get_users_use_case.dart';
import '../../domain/use_cases/update_role_use_case.dart';
import '../cubit/get_users_cubit.dart';

class UpdateUserRoleCubit extends Cubit<UsersState> {
  GetUsers getUsersUseCase;
  UpdateUserRole updateUserRoleUseCase;

  UpdateUserRoleCubit()
      : getUsersUseCase = getIt(),
        updateUserRoleUseCase = getIt(),
        super(GetUsersInitial());

  Future<void> updateUserRole({
    required int userId,
    required String role,
  }) async {
    emit(UpdateUserRoleLoading());

    final response = await updateUserRoleUseCase.call(
      userId: userId,
      role: role,
    );

    response.fold(
      (failure) => emit(UpdateUserRoleFailed(errMsg: failure.errMessage)),
      (success) {
        RoleUpdateService.updateRole(
          userId: userId,
          newRole: role,
        );
        emit(
          UpdateUserRoleSuccess(message: success.message),
        );
      },
    );
  }
}

part of 'get_users_cubit.dart';

@immutable
sealed class UsersState {}

final class GetUsersInitial extends UsersState {}

final class GetUsersLoading extends UsersState {}

final class GetUsersSuccess extends UsersState {
  final GetUsersEntity usersList;
  GetUsersSuccess({required this.usersList});
}

final class GetUsersFailed extends UsersState {
  final String errMsg;
  GetUsersFailed({required this.errMsg});
}

final class UpdateUserRoleLoading extends UsersState {}

final class UpdateUserRoleFailed extends UsersState {
  final String errMsg;
  UpdateUserRoleFailed({required this.errMsg});
}

final class UpdateUserRoleSuccess extends UsersState {
  final String message;
  UpdateUserRoleSuccess({required this.message});
}

part of 'get_users_cubit.dart';

@immutable
sealed class GetUsersState {}

final class GetUsersInitial extends GetUsersState {}

final class GetUsersLoading extends GetUsersState {}

final class GetUsersSuccess extends GetUsersState {
  final GetUsersEntity usersList;
  GetUsersSuccess({required this.usersList});
}

final class GetUsersFailed extends GetUsersState {
  final String errMsg;
  GetUsersFailed({required this.errMsg});
}

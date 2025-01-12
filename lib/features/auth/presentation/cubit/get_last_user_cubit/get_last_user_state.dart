part of 'get_last_user_cubit.dart';

sealed class GetLastUserState extends Equatable {
  const GetLastUserState();

  @override
  List<Object> get props => [];
}

final class GetLastUserInitial extends GetLastUserState {}

final class UserLoaded extends GetLastUserState {
  final UserEntity user;

  const UserLoaded({required this.user});
}

final class NoUserFound extends GetLastUserState {}

final class UserLoading extends GetLastUserState {}

final class FaildToLoad extends GetLastUserState {
  final String errMsg;

  const FaildToLoad({required this.errMsg});
}

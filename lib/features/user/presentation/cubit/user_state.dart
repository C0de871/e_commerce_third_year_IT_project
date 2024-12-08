part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}


//! login states:
final class LoginUserSuccessfully extends UserState {
  final UserEntity user;
  LoginUserSuccessfully({required this.user});
}

final class LoginUserLoading extends UserState {}

final class LoginUserFailure extends UserState {
  final String errMessage;
  LoginUserFailure({required this.errMessage});
}

//! Sign up states:
final class SignUpUserSuccessfully extends UserState {
  final SignUpEntity signUpEntity;

  SignUpUserSuccessfully({required this.signUpEntity});
}

final class SignUpUserFailure extends UserState {
  final String errMessage;
  SignUpUserFailure({required this.errMessage});
}

final class SignUpUserLoading extends UserState {}

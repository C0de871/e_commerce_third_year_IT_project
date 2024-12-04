part of 'user_cubit.dart';

@immutable
sealed class UserState {}


final class UserInitial extends UserState{}
final class LoginUserSuccessfully extends   UserState{
final UserEntity user;

  LoginUserSuccessfully({required this.user});
}
final class LoginUserLoading extends UserState{}
final class LoginUserFailure extends UserState{
  final String errMessage;

  LoginUserFailure({required this.errMessage}); 
}






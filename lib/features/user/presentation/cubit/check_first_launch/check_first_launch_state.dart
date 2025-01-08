part of 'check_first_launch_cubit.dart';

sealed class CheckFirstLaunchState extends Equatable {
  const CheckFirstLaunchState();

  @override
  List<Object> get props => [];
}

final class CheckFirstLaunchInitial extends CheckFirstLaunchState {}

final class CheckFirstLaunchLoaded extends CheckFirstLaunchState {
  final bool isFirstLaunch;

  const CheckFirstLaunchLoaded({required this.isFirstLaunch});
}

final class CheckFirstLaunchLoading extends CheckFirstLaunchState {}

final class CheckFirstLaunchFailed extends CheckFirstLaunchState {
  final String errMsg;

  const CheckFirstLaunchFailed({required this.errMsg});
}

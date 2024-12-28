part of 'toggle_fav_cubit.dart';

@immutable
sealed class ToggleFavOnState {}

final class ToggleFavInitial extends ToggleFavOnState {}

final class ToggleFavLoading extends ToggleFavOnState {}

final class ToggleFavFailure extends ToggleFavOnState {
  final String msg;

  ToggleFavFailure({required this.msg});
}

final class ToggleFavSuccess extends ToggleFavOnState {
  final ToggleFavEntity toggleFavOnEntity;

  ToggleFavSuccess({required this.toggleFavOnEntity});
}

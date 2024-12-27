part of 'toggle_fav_on_cubit.dart';

@immutable
sealed class ToggleFavOnState {}

final class ToggleFavOnInitial extends ToggleFavOnState {}

final class ToggleFavOnLoading extends ToggleFavOnState {}

final class ToggleFavOnFailure extends ToggleFavOnState {
  final String msg;

  ToggleFavOnFailure({required this.msg});
}

final class ToggleFavOnSuccess extends ToggleFavOnState {
  final ToggleFavOnEntity toggleFavOnEntity;

  ToggleFavOnSuccess({required this.toggleFavOnEntity});
}

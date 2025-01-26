part of 'show_store_cubit.dart';

sealed class ShowStoreState {
  const ShowStoreState();
}

final class ShowStoreInitial extends ShowStoreState {}

final class ShowStoreFailed extends ShowStoreState {
  String msg;

  ShowStoreFailed({required this.msg});
}

final class ShowStoreSuccess extends ShowStoreState {
  ShowStoreEntity showStoreEntity;

  ShowStoreSuccess({required this.showStoreEntity});
}

final class ShowStoreLoading extends ShowStoreState {}

part of 'store_cubit.dart';

@immutable
sealed class StoreState {}

final class StoreInitial extends StoreState {}

final class GetAllStoresSuccess extends StoreState {
  final List<StoreEntity> storesList;
  GetAllStoresSuccess({required this.storesList});
}

final class GetAllStoresLoading extends StoreState {}

final class GetAllStoresFailed extends StoreState {
  final String errMes;

  GetAllStoresFailed({required this.errMes});
}

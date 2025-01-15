part of 'show_store_cubit.dart';

sealed class ShowStoreState {
  const ShowStoreState();
}

final class ShowStoreInitial extends ShowStoreState {}

final class ShowStoreLoading extends ShowStoreState {}

final class ShowStoreSuccess extends ShowStoreState {
  final ShowStoreEntity storeDetails;

  ShowStoreSuccess({required this.storeDetails});

  ShowStoreSuccess copyWith({ShowStoreEntity? storeDetails}) {
    return ShowStoreSuccess(
      storeDetails: storeDetails ?? this.storeDetails,
    );
  }
}

final class ShowStoreFailed extends ShowStoreState {
  String errMsg;
  ShowStoreFailed({required this.errMsg});
}

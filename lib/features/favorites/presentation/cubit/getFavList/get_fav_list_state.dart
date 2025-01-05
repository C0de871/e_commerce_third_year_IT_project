part of 'get_fav_list_cubit.dart';

sealed class GetFavListState extends Equatable {
  const GetFavListState();

  @override
  List<Object> get props => [];
}

final class GetFavListInitial extends GetFavListState {}

final class GetFavListLoading extends GetFavListState {}

final class GetFavListFailure extends GetFavListState {
  final String errMsg;

  const GetFavListFailure({required this.errMsg});
}

final class GetFavListSuccess extends GetFavListState {
  final GetFavListEntity getFavListEntity;
  const GetFavListSuccess({required this.getFavListEntity});
}

part of 'get_product_details_cubit.dart';

@immutable
sealed class GetProductDetailsState {}

final class GetProductDetailsInitial extends GetProductDetailsState {}

final class GetProductDetailsLoading extends GetProductDetailsState {}

final class GetProductDetailsFailed extends GetProductDetailsState {
  final String msg;
  GetProductDetailsFailed({required this.msg});
}

final class GetProductDetailsSuccess extends GetProductDetailsState {
  final GetProductDetailsEntity productDetailsEntity;
  GetProductDetailsSuccess({required this.productDetailsEntity});
}

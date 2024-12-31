part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class GetAllProductsLoading extends ProductState {}

final class GetAllProductsSuccess extends ProductState {
  final List<ProductEntity> productsList;
  GetAllProductsSuccess({required this.productsList});
}

final class GetAllProductsFailed extends ProductState {
  final String errMessage;

  GetAllProductsFailed({required this.errMessage});
}

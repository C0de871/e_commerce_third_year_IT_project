// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class GetAllProductsLoading extends ProductState {}

final class GetAllProductsSuccess extends ProductState {
  final GetAllProductsEntity getAllProductsEntity;
  GetAllProductsSuccess({required this.getAllProductsEntity});

  GetAllProductsSuccess copyWith({
    GetAllProductsEntity? getAllProductsEntity,
  }) {
    return GetAllProductsSuccess(
      getAllProductsEntity: getAllProductsEntity ?? this.getAllProductsEntity,
    );
  }
}

final class GetAllProductsFailed extends ProductState {
  final String errMessage;

  GetAllProductsFailed({required this.errMessage});
}

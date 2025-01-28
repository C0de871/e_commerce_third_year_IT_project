part of 'delete_product_cubit.dart';

sealed class DeleteProductState {
  const DeleteProductState();
}

final class DeleteProductInitial extends DeleteProductState {}

final class DeleteProductLoading extends DeleteProductState {}

final class DeleteProductSuccess extends DeleteProductState {
  DeleteProductEntity deleteProductEntity;
  DeleteProductSuccess({required this.deleteProductEntity});
}

final class DeleteProductFailed extends DeleteProductState {
  String errMsg;
  DeleteProductFailed({required this.errMsg});
}

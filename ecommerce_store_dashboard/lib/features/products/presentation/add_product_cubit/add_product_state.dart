part of 'add_product_cubit.dart';

/// Base class for all states.
sealed class AddProductState {
  const AddProductState();
}

final class AddProductInitial extends AddProductState {}

final class AddProductLoading extends AddProductState {}

/// State to indicate the action completed successfully.
final class AddProductSuccess extends AddProductState {
  AddProductEntity addProductEntity;

  AddProductSuccess({required this.addProductEntity});
}

/// State to indicate an error occurred.
final class AddProductError extends AddProductState {
  final String message;

  const AddProductError(this.message);
}

final class UploadMainImageSuccess extends AddProductState {}

final class UploadMainImageLoading extends AddProductState {}

final class UploadSubImageSuccess extends AddProductState {}

final class UploadSubImageLoading extends AddProductState {}

final class StatusChange extends AddProductState {}

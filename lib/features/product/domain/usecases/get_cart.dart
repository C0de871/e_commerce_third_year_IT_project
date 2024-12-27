import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/product/domain/entites/cart_entity.dart';
import 'package:e_commerce/features/product/domain/repository/cart_repository.dart';

class GetCart {
  final CartRepository cartRepository;

  GetCart({required this.cartRepository});
  Future<Either<Failure, CartEntity>> call() {
    return cartRepository.getCart();
  }
}

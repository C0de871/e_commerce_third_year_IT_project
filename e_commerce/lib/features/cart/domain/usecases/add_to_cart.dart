import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/features/cart/domain/entites/add_to_cart_entity.dart';
import 'package:e_commerce/features/cart/domain/repository/cart_repository.dart';

class AddToCart {
  final CartRepository cartRepository;

  AddToCart({required this.cartRepository});

  Future<Either<Failure, AddToCartEntity>> call(
      {required GetStoredAndProductIdParams params,
      required Map<String, dynamic> bodyJson}) {
    return cartRepository.addToCart(params: params, bodyJson: bodyJson);
  }
}

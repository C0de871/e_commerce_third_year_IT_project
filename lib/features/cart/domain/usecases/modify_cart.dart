import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/features/cart/domain/entites/cart_entity.dart';
import 'package:e_commerce/features/cart/domain/repository/cart_repository.dart';

class ModifyCart {
  final CartRepository cartRepository;

  ModifyCart({required this.cartRepository});

  Future<Either<Failure, CartEntity>> call(
      {required Map<String, dynamic> bodyJson}) {
    return cartRepository.modifyCart(bodyJson: bodyJson);
  }
}

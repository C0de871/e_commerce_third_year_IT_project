import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/core/shared/domain/entities/message_entety.dart';
import 'package:e_commerce/features/cart/domain/repository/cart_repository.dart';

class DeleteCart {
  final CartRepository cartRepository;

  DeleteCart({required this.cartRepository});
  Future<Either<Failure, MessageEntity>> call(
      {required Map<String, dynamic> bodyJson}) {
    return cartRepository.deleteCart(bodyJson: bodyJson);
  }
}

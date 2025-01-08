import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/features/cart/domain/entites/size_cart_entity.dart';
import 'package:e_commerce/features/cart/domain/repository/cart_repository.dart';

class GetSizeCart {
final CartRepository cartRepository;

  GetSizeCart({required this.cartRepository});
Future<Either<Failure,SizeCartEntity>> call(){
return cartRepository.getSizeCart();

}
}

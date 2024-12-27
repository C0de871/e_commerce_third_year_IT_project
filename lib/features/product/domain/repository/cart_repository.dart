import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/product/domain/entites/cart_entity.dart';

abstract class CartRepository {
Future<Either<Failure,CartEntity>> getCart();

}

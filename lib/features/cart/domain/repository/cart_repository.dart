import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/core/shared/domain/entities/message_entety.dart';
import 'package:e_commerce/features/cart/domain/entites/add_to_cart_entity.dart';
import 'package:e_commerce/features/cart/domain/entites/cart_entity.dart';
import 'package:e_commerce/features/cart/domain/entites/modify_cart/modify_cart.dart';
import 'package:e_commerce/features/cart/domain/entites/size_cart_entity.dart';
import 'package:e_commerce/features/get_product_details/presentation/screens/product_details_screen.dart';

abstract class CartRepository {
  Future<Either<Failure, CartEntity>> getCart();
  Future<Either<Failure, CartEntity>> modifyCart(
      {required Map<String, dynamic> bodyJson});
  Future<Either<Failure, MessageEntity>> deleteCart(
      {required Map<String, dynamic> bodyJson});
  Future<Either<Failure, MessageEntity>> clearCart();
  Future<Either<Failure,SizeCartEntity>> getSizeCart();
  Future<Either<Failure, AddToCartEntity>> addToCart(
      {required GetStoredAndProductIdParams params,required Map<String,dynamic> bodyJson});
}

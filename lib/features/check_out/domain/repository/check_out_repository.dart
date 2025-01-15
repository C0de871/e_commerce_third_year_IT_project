import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/core/shared/domain/entities/message_entety.dart';
import 'package:e_commerce/features/cart/domain/entites/cart_entity.dart';
import 'package:e_commerce/features/cart/domain/entites/modify_cart/modify_cart.dart';
import 'package:e_commerce/features/check_out/domain/entites/check_out_order/check_out_order_entity.dart';

abstract class CheckOutRepository {
  Future<Either<Failure,CheckOutOrderEntity>> createOrder(
  {required Map<String,dynamic> bodyJson
  }  );
  // Future<Either<Failure, CartEntity>> getCart();
  // Future<Either<Failure, List<ModifyCartEntity>>> modifyCart(
  //     {required Map<String, dynamic> bodyJson});
  // Future<Either<Failure, MessageEntity>> deleteCart(
  //     {required Map<String, dynamic> bodyJson});
  // Future<Either<Failure, MessageEntity>> clearCart();
}

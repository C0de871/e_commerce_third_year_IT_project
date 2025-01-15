import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/core/shared/domain/entities/message_entety.dart';
import 'package:e_commerce/features/cart/domain/entites/cart_entity.dart';
import 'package:e_commerce/features/cart/domain/entites/modify_cart/modify_cart.dart';
import 'package:e_commerce/features/check_out/domain/entites/check_out_order/check_out_order_entity.dart';
import 'package:e_commerce/features/order/domain/entites/order_entity.dart';
import 'package:e_commerce/features/order/domain/entites/sub_order_entity.dart';

abstract class OrderRepository {
  Future<Either<Failure,OrderEntity>> getOrder();
  // Future<Either<Failure, List<ModifyCartEntity>>> modifyCart(
  //     {required Map<String, dynamic> bodyJson});
  // Future<Either<Failure, MessageEntity>> deleteCart(
  //     {required Map<String, dynamic> bodyJson});
  // Future<Either<Failure, MessageEntity>> clearCart();
}

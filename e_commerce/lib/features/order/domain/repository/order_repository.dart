import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/core/shared/domain/entities/message_entety.dart';
import '../entites/order_entity.dart';

abstract class OrderRepository {
  Future<Either<Failure, OrderEntity>> getOrder();
  Future<Either<Failure, MessageEntity>> deleteOrder(
      {required GetOrderIdParams params});

  // Future<Either<Failure, List<ModifyCartEntity>>> modifyCart(
  //     {required Map<String, dynamic> bodyJson});
  // Future<Either<Failure, MessageEntity>> deleteCart(
  //     {required Map<String, dynamic> bodyJson});
  // Future<Either<Failure, MessageEntity>> clearCart();
}

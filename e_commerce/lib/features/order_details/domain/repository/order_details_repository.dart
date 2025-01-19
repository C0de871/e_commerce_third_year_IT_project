import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/features/order_details/domain/entites/order_details_entity/order_details_entity.dart';

abstract class OrderDetailsRepository {
  Future<Either<Failure, OrderDetailsEntity>> getOrderDetails({required GetOrderIdParams params});


  // Future<Either<Failure, List<ModifyCartEntity>>> modifyCart(
  //     {required Map<String, dynamic> bodyJson});
  // Future<Either<Failure, MessageEntity>> deleteCart(
  //     {required Map<String, dynamic> bodyJson});
  // Future<Either<Failure, MessageEntity>> clearCart();
}

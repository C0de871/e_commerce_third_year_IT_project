import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/features/check_out/domain/entites/check_out_order/check_out_order_entity.dart';

abstract class CheckOutRepository {
  Future<Either<Failure, CheckOutOrderEntity>> createOrder(
      {required Map<String, dynamic> bodyJson});
}

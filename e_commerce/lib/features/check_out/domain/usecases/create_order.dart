import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/features/check_out/domain/entites/check_out_order/check_out_order_entity.dart';
import 'package:e_commerce/features/check_out/domain/repository/check_out_repository.dart';

class CreateOrder {
  final CheckOutRepository checkOutRepository;

  CreateOrder({required this.checkOutRepository});
  Future<Either<Failure, CheckOutOrderEntity>> call(
      {required Map<String, dynamic> bodyJson}) {
    return checkOutRepository.createOrder(bodyJson: bodyJson);
  }
}

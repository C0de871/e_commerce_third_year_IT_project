import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/features/order_details/domain/entites/order_details_entity/order_details_entity.dart';
import 'package:e_commerce/features/order_details/domain/repository/order_details_repository.dart';

class GetOrderDetails {
  final OrderDetailsRepository orderDetailsRepository;

  GetOrderDetails({required this.orderDetailsRepository});

  Future<Either<Failure, OrderDetailsEntity>> call({
    required GetOrderIdParams params,
  }) {
    return orderDetailsRepository.getOrderDetails(
      params: params,
    );
  }
}

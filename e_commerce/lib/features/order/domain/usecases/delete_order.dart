import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/core/shared/domain/entities/message_entety.dart';
import 'package:e_commerce/features/order/domain/repository/order_repository.dart';

class DeleteOrder {
  final OrderRepository orderRepository;

  DeleteOrder({required this.orderRepository});
  Future<Either<Failure, MessageEntity>> call({
    required GetOrderIdParams params,
  }) {
    return orderRepository.deleteOrder(
      params: params,
    );
  }
}

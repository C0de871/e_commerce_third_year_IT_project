import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/features/cart/domain/entites/cart_entity.dart';
import '../entites/order_entity.dart';
import '../repository/order_repository.dart';

class GetOrder {

  final OrderRepository orderRepository;

  GetOrder({required this.orderRepository});

  Future<Either<Failure,OrderEntity>> call() {
    return orderRepository.getOrder();
  }


}
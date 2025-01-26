import 'package:dartz/dartz.dart';
import 'package:ecommerce_store_dashboard/features/order_dash/domain/entities/order/order_entity.dart';
import 'package:ecommerce_store_dashboard/features/order_dash/domain/order%20repository/order_dash_repository.dart';
import '../../../../core/databases/errors/failure.dart';

class GetOrderDash {
  final OrderDashRepository orderRepository;
  GetOrderDash({required this.orderRepository});
  Future<Either<Failure, OrderEntity>> call() {
    return orderRepository.getOrderDash();
  }
}

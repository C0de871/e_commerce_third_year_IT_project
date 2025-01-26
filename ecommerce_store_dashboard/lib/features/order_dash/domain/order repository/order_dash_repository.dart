import 'package:dartz/dartz.dart';
import 'package:ecommerce_store_dashboard/features/order_dash/domain/entities/order/order_entity.dart';
import '../../../../core/databases/errors/failure.dart';
abstract class OrderDashRepository {
  Future<Either<Failure, OrderEntity>> getOrderDash();
}

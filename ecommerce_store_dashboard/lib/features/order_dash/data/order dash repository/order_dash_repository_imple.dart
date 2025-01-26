import 'package:dartz/dartz.dart';
import 'package:ecommerce_store_dashboard/features/order_dash/domain/entities/order/order_entity.dart';
import 'package:ecommerce_store_dashboard/features/order_dash/domain/order%20repository/order_dash_repository.dart';
import '../../../../core/databases/connection/network_info.dart';
import '../../../../core/databases/errors/expentions.dart';
import '../../../../core/databases/errors/failure.dart';
import '../order data sources/order_dash_remote_data_source.dart';

class OrderDashRepositoryImple extends OrderDashRepository {
  final NetworkInfo networkInfo;
  final OrderDashRemoteDataSource remoteDataSource;

  OrderDashRepositoryImple({required this.networkInfo, required this.remoteDataSource});
  @override
  Future<Either<Failure, OrderEntity>> getOrderDash() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteTempleT = await remoteDataSource.getOrderDash();

        return Right(remoteTempleT);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: "There is no internet connnect"));
    }
  }

}

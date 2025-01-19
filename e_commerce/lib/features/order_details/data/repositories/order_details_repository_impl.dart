import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/connection/network_info.dart';
import 'package:e_commerce/core/databases/errors/expentions.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/features/order_details/domain/entites/order_details_entity/order_details_entity.dart';
import 'package:e_commerce/features/order_details/domain/repository/order_details_repository.dart';
import '../datasourses/order_details_remote_data_source.dart';

class OrderDetailsRepositoryImpl extends OrderDetailsRepository {
  final NetworkInfo networkInfo;
  final OrderDetailsRemoteDataSource remoteDataSource;

  OrderDetailsRepositoryImpl({required this.networkInfo, required this.remoteDataSource});


//! get order details:
  @override
  Future<Either<Failure, OrderDetailsEntity>> getOrderDetails({required GetOrderIdParams params,}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteGetOrder = await remoteDataSource.getOrderDetails(params);
        return Right(remoteGetOrder);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(
        Failure(
          errMessage: remoteDataSource.noInternectConnection(),
        ),
      );
    }
  }

}

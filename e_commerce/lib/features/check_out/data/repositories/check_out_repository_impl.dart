import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/connection/network_info.dart';
import 'package:e_commerce/core/databases/errors/expentions.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/features/check_out/data/datasourses/check_out_remote_data_source.dart';
import 'package:e_commerce/features/check_out/domain/entites/check_out_order/check_out_order_entity.dart';
import 'package:e_commerce/features/check_out/domain/repository/check_out_repository.dart';

class CheckOutRepositoryImpl extends CheckOutRepository {
  final NetworkInfo networkInfo;
  final CheckOutRemoteDataSource remoteDataSource;

  CheckOutRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });
  //! create order:

  @override
  Future<Either<Failure, CheckOutOrderEntity>> createOrder(
      {required bodyJson}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteCreateOrderCart =
            await remoteDataSource.createOrder(bodyJson: bodyJson);
        return Right(remoteCreateOrderCart);
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

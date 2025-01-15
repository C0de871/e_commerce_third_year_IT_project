import 'package:dartz/dartz.dart';

import '../../../../core/databases/connection/network_info.dart';
import '../../../../core/databases/errors/expentions.dart';
import '../../../../core/databases/errors/failure.dart';
import '../../../../core/databases/params/params.dart';
import '../../domain/entities/get_product_details_entity.dart';
import '../../domain/repository/get_product_details_repository.dart';
import '../data sources/get_product_details_remote_data_source.dart';

class GetProductDetailsRepositoryImpl extends GetProductDetailsRepository {
  final NetworkInfo networkInfo;
  final GetProductDetailsRemoteDataSource remoteDataSource;
  GetProductDetailsRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, GetProductDetailsEntity>> getProductDetails(
      {required GetProductDetailsParams params}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteGetProductDetails =
            await remoteDataSource.getProductDetails(params);

        return Right(remoteGetProductDetails);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      //TODO make this message adapt to app language:
      return Left(Failure(errMessage: "There is no internet connnect"));
    }
  }
}

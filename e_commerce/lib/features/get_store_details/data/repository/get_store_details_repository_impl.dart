import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/features/get_store_details/data/datasources/get_store_details_data_source.dart';
import 'package:e_commerce/features/get_store_details/domain/entities/show_store_entities/show_store_entity.dart';
import 'package:e_commerce/features/get_store_details/domain/repository/get_store_details_repository.dart';

import '../../../../core/databases/connection/network_info.dart';
import '../../../../core/databases/errors/expentions.dart';
import '../../../../core/databases/errors/failure.dart';

class GetStoreDetailsRepositoryImpl extends GetStoreDetailsRepository {
  final NetworkInfo networkInfo;
  final GetStoreDetailsDataSource remoteDataSource;
  GetStoreDetailsRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, ShowStoreEntity>> showStore(
      {required ShowStoreParams params}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteShowStore = await remoteDataSource.showStore(params);

        return Right(remoteShowStore);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      //TODO make this message adapt to app language:
      return Left(Failure(errMessage: "There is no internet connnect"));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/connection/network_info.dart';
import 'package:e_commerce/core/databases/errors/expentions.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/features/stores/data/dataSources/store_remote_data_source.dart';
import 'package:e_commerce/features/stores/domain/entities/git_stores_entity.dart';
import 'package:e_commerce/features/stores/domain/repository/store_repository.dart';

class StoreRepositoryImpl extends StoreRepository {
  final NetworkInfo network;
  final StoreRemoteDataSource remoteDataSource;

  StoreRepositoryImpl({required this.network, required this.remoteDataSource});
  @override
  Future<Either<Failure, GetStoresEntity>> getAllStores({required StoreParams params}) async {
    if (await network.isConnected!) {
      try {
        final remoteStores = await remoteDataSource.getAllStores(params: params);
        return Right(remoteStores);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      //TODO make this message adapt to app language:
      return Left(Failure(errMessage: "There is no internet connnect"));
    }
  }
}

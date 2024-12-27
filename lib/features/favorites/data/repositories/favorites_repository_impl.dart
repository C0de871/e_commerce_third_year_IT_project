import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';

import '../../../../core/databases/connection/network_info.dart';
import '../../../../core/databases/errors/expentions.dart';
import '../../../../core/databases/params/params.dart';
import '../../domain/entities/toggle_fav_on_entitiy.dart';
import '../../domain/repositories/favorites_repository.dart';
import '../datasources/favorites_remote_data_source.dart';

class FavoritesRepositoryImpl extends FavoritesRepository {
  final NetworkInfo networkInfo;
  final FavoritesRemoteDataSource remoteDataSource;
  FavoritesRepositoryImpl({required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, ToggleFavOnEntity>> getToggleFavOn({required ToggleFavOnParams params}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteToggleFavOn = await remoteDataSource.getToggleFavOn(params);

        return Right(remoteToggleFavOn);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      //TODO make this message adapt to app language:
      return Left(Failure(errMessage: "There is no internet connnect"));
    }
  }
}
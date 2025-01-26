import 'package:dartz/dartz.dart';

import '../../../../core/databases/connection/network_info.dart';
import '../../../../core/databases/errors/expentions.dart';
import '../../../../core/databases/errors/failure.dart';
import '../../../../core/databases/params/params.dart';
import '../../domain/entities/add_products_entities/add_product_entity.dart';
import '../../domain/entities/show_store_entities/show_store_entity.dart';
import '../../domain/repository/products_repository.dart';
import '../data sources/products_remote_data_source.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final NetworkInfo networkInfo;
  final ProductsRemoteDataSource remoteDataSource;
  ProductsRepositoryImpl({required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, AddProductEntity>> addProduct({
    required AddProductParams params,
    required Map<String, dynamic> body,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteTempleT = await remoteDataSource.addProduct(params, body);

        return Right(remoteTempleT);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      //TODO make this message adapt to app language:
      return Left(Failure(errMessage: "There is no internet connnect"));
    }
  }

  @override
  Future<Either<Failure, ShowStoreEntity>> showStore({
    required ShowStoreParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteTempleT = await remoteDataSource.showStore(params);

        return Right(remoteTempleT);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      //TODO make this message adapt to app language:
      return Left(Failure(errMessage: "There is no internet connnect"));
    }
  }
}

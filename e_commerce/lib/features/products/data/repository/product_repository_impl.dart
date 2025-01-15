// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:e_commerce/core/databases/connection/network_info.dart';
import 'package:e_commerce/core/databases/errors/expentions.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/features/products/data/dataSources/product_remote_data_source.dart';
import 'package:e_commerce/features/products/domain/entities/get_all_products_entity.dart';
import 'package:e_commerce/features/products/domain/repository/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  ProductRemoteDataSource productRemoteDataSource;
  NetworkInfo networkInfo;
  ProductRepositoryImpl({
    required this.productRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, GetAllProductsEntity>> getAllProducts(
      {required ProductParams params}) async {
    if (await networkInfo.isConnected!) {
      try {
        final GetAllProductsEntity productsList =
            await productRemoteDataSource.getAllProducts(params: params);
        return Right(productsList);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      //TODO make this message adapt to app language:
      return Left(Failure(errMessage: "There is no internet connnect"));
    }
  }
}

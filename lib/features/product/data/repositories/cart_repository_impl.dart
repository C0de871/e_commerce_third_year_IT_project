import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/connection/network_info.dart';
import 'package:e_commerce/core/errors/expentions.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/product/data/datasourses/cart_remote_data_source.dart';
import 'package:e_commerce/features/product/domain/entites/cart_entity.dart';
import 'package:e_commerce/features/product/domain/repository/cart_repository.dart';
import 'package:e_commerce/features/product/domain/usecases/get_cart.dart';
import 'package:e_commerce/features/user/data/datasourses/user_local_data_source.dart';
import 'package:e_commerce/features/user/data/datasourses/user_remote_data_source.dart';

class CartRepositoryImpl extends CartRepository {
  final NetworkInfo networkInfo;
  final CartRemoteDataSource remoteDataSource;

  CartRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, CartEntity>> getCart() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteGetCart = await remoteDataSource.getCart();
        return Right(remoteGetCart);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } 
  else{
    return Left(
        Failure(
          errMessage: remoteDataSource.noInternectConnection(),
        ),
      );
    }
  }
}


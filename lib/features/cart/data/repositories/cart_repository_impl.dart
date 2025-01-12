
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/connection/network_info.dart';
import 'package:e_commerce/core/databases/errors/expentions.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/core/shared/domain/entities/message_entety.dart';
import 'package:e_commerce/features/cart/data/datasourses/cart_remote_data_source.dart';
import 'package:e_commerce/features/cart/domain/entites/add_to_cart_entity.dart';
import 'package:e_commerce/features/cart/domain/entites/cart_entity.dart';
import 'package:e_commerce/features/cart/domain/entites/size_cart_entity.dart';
import 'package:e_commerce/features/cart/domain/repository/cart_repository.dart';

class CartRepositoryImpl extends CartRepository {
  final NetworkInfo networkInfo;
  final CartRemoteDataSource remoteDataSource;

  CartRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });
//! get cart:
  @override
  Future<Either<Failure, CartEntity>> getCart() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteGetCart = await remoteDataSource.getCart();
        return Right(remoteGetCart);
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

//! confirm modify products:
  @override
  Future<Either<Failure, CartEntity>> modifyCart(
      {required bodyJson}) async {
    if (await networkInfo.isConnected!) {
      try {
        final CartEntity cartEntity =
            await remoteDataSource.modifyCart(bodyJson);

        return Right(cartEntity);
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

//! confirm delete products:
  @override
  Future<Either<Failure, MessageEntity>> deleteCart(
      {required Map<String, dynamic> bodyJson}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteDeleteCart = await remoteDataSource.deleteCart(bodyJson);
        return Right(remoteDeleteCart);
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

//! clear cart:
  @override
  Future<Either<Failure, MessageEntity>> clearCart() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteClearCart = await remoteDataSource.clearCart();
        return Right(remoteClearCart);
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
//! get size:
  @override
  Future<Either<Failure, SizeCartEntity>> getSizeCart() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteSizeCart = await remoteDataSource.getSizeCart();
        return Right(remoteSizeCart);
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
  //!add to cart:
  @override
  Future<Either<Failure, AddToCartEntity>> addToCart(
      {required GetStoredAndProductIdParams params ,required Map<String,dynamic> bodyJson}) async {
    if (await networkInfo.isConnected!) {
      try {
        final AddToCartEntity addToCartEntity =
            await remoteDataSource.addToCart(params,bodyJson);

        return Right(addToCartEntity);
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

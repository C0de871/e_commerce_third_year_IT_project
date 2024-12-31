import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/databases/connection/network_info.dart';
import 'package:e_commerce/core/databases/errors/expentions.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/features/cart/data/datasourses/cart_remote_data_source.dart';
import 'package:e_commerce/features/cart/domain/entites/cart_entity.dart';
import 'package:e_commerce/features/cart/domain/entites/modify_cart/modify_cart.dart';
import 'package:e_commerce/features/cart/domain/repository/cart_repository.dart';
import 'package:e_commerce/features/cart/domain/usecases/get_cart.dart';
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
    } else {
      return Left(
        Failure(
          errMessage: remoteDataSource.noInternectConnection(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ModifyCartEntity>>> modifyCart({required bodyJson}) async {
    if(await networkInfo.isConnected!){
try {
        final List<ModifyCartEntity> remotePostCart = await remoteDataSource.modifyCart(bodyJson);
        
        return Right(remotePostCart);
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
  

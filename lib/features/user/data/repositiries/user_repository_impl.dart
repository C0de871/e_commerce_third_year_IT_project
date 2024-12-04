import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/connection/network_info.dart';
import 'package:e_commerce/core/errors/expentions.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/user/data/datasourses/user_local_data_source.dart';
import 'package:e_commerce/features/user/data/datasourses/user_remote_data_source.dart';
import 'package:e_commerce/features/user/domain/entites/user_entities/user_entities.dart';
import 'package:e_commerce/features/user/domain/repository/user_repository.dart';
import 'package:e_commerce/features/user/domain/usecases/login_user.dart';
import 'package:flutter/services.dart';

class UserRepositoryImpl extends UserRepository {
  final NetworkInfo networkInfo;
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;


  UserRepositoryImpl({required this.remoteDataSource,required this.localDataSource,  required this.networkInfo});
  @override
  Future<Either<Failure, UserEntity>> loginUser( {required Map<String, dynamic> bodyjson})async {
    if(await networkInfo.isConnected!){
      try{
    final remoteUser = await remoteDataSource.loginUser(bodyjson);
    localDataSource.cacheUser(remoteUser);
    return Right(remoteUser);}on ServerException catch(e){
      return Left(Failure(errMessage:e.errorModel.errorMessage ));
    }}else{
      try{
final localUser=await localDataSource.getLastUser();
return Right(localUser);

    }on CacheExeption catch(e){
      return Left(Failure(errMessage: e.errorMessage));
    }
    }}
}
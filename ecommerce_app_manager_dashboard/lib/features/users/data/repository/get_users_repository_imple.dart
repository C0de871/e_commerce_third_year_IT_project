import 'package:dartz/dartz.dart';

import '../../../../core/databases/connection/network_info.dart';
import '../../../../core/databases/errors/expentions.dart';
import '../../../../core/databases/errors/failure.dart';
import '../../domain/entities/get_users_entity/get_users_entity.dart';
import '../../domain/entities/update_role_entity/update_role_entity.dart';
import '../../domain/repository/get_users_repository.dart';
import '../data sources/get_users_remote_data_source.dart';

class GetUsersRepositoryImple extends GetUsersRepository {
  final NetworkInfo networkInfo;
  final GetUsersRemoteDataSource remoteDataSource;
  GetUsersRepositoryImple({required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, GetUsersEntity>> getUsers() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteTempleT = await remoteDataSource.getUsers();

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
  Future<Either<Failure, AssignRoleEntity>> updateUserRole({
    required int userId,
    required String role,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final response = await remoteDataSource.updateUserRole(
          userId: userId,
          role: role,
        );
        return Right(response);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: "There is no internet connection"));
    }
  }
}

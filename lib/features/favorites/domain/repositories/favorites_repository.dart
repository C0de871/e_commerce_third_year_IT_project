import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import '../entities/get_fav_list_entity/get_fav_list_entity.dart';
import '../entities/toggle_fav_entitiy.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, ToggleFavEntity>> getToggleFavOn({required ToggleFavParams params});
  Future<Either<Failure, ToggleFavEntity>> getToggleFavOff({required ToggleFavParams params});

  Future<Either<Failure, GetFavListEntity>> getFavList();
}

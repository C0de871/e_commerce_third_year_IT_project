import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import '../entities/toggle_fav_on_entitiy.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, ToggleFavOnEntity>> getToggleFavOn({required ToggleFavOnParams params});
}

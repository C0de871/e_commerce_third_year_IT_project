import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/core/databases/params/params.dart';

import '../entities/toggle_fav_entitiy.dart';
import '../repositories/favorites_repository.dart';

class ToggleFavOn {
  final FavoritesRepository repository;

  ToggleFavOn({required this.repository});

  Future<Either<Failure, ToggleFavEntity>> call({required ToggleFavParams params}) {
    return repository.getToggleFavOn(params: params);
  }
}

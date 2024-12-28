import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/core/databases/params/params.dart';

import '../entities/toggle_fav_entitiy.dart';
import '../repositories/favorites_repository.dart';

class ToggleFavOff {
  final FavoritesRepository repository;

  ToggleFavOff({required this.repository});

  Future<Either<Failure, ToggleFavEntity>> call({required ToggleFavParams params}) {
    return repository.getToggleFavOff(params: params);
  }
}

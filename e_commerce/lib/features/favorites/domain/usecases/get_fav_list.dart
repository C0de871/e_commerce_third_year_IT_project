// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/favorites/domain/repositories/favorites_repository.dart';

import '../../../../core/databases/errors/failure.dart';
import '../entities/get_fav_list_entity/get_fav_list_entity.dart';

class GetFavList {
  final FavoritesRepository favoritesRepository;
  GetFavList({
    required this.favoritesRepository,
  });

  Future<Either<Failure, GetFavListEntity>> call() {
    return favoritesRepository.getFavList();
  }
}

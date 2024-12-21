import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/features/stores/domain/entities/store_entity.dart';
import 'package:e_commerce/features/stores/domain/repository/store_repository.dart';

class GetAllStores {
  final StoreRepository storeRepository;

  GetAllStores({required this.storeRepository});
  Future<Either<Failure, List<StoreEntity>>> call({required StoreParams params}) {
    return storeRepository.getAllStores(params: params);
  }
}

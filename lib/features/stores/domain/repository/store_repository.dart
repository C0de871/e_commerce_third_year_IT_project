import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/features/stores/domain/entities/store_entity.dart';

import '../../../../core/databases/errors/failure.dart';

abstract class StoreRepository {
  Future<Either<Failure, StoreEntity>> getAllStores({required StoreParams params});
}

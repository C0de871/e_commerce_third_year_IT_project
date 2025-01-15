import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/features/get_store_details/domain/entities/show_store_entities/show_store_entity.dart';
import 'package:e_commerce/features/get_store_details/domain/repository/get_store_details_repository.dart';

import '../../../../core/databases/errors/failure.dart';

class GetStoreDetails {
  final GetStoreDetailsRepository repository;

  GetStoreDetails({required this.repository});

  Future<Either<Failure, ShowStoreEntity>> call({required ShowStoreParams params}) {
    return repository.showStore(params: params);
  }
}

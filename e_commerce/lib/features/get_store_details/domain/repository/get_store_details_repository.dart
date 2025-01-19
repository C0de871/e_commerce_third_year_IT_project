import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/features/get_store_details/data/datasources/get_store_details_data_source.dart';
import 'package:e_commerce/features/get_store_details/domain/entities/show_store_entities/show_store_entity.dart';

abstract class GetStoreDetailsRepository {
  GetStoreDetailsRepository();

  Future<Either<Failure, ShowStoreEntity>> showStore(
      {required ShowStoreParams params});
}

import 'package:dartz/dartz.dart';
import 'package:ecommerce_store_dashboard/features/products/domain/entities/show_store_entities/show_store_entity.dart';

import '../../../../core/databases/errors/failure.dart';
import '../../../../core/databases/params/params.dart';
import '../repository/products_repository.dart';

class ShowStoreUseCase {
  final ProductsRepository repository;

  ShowStoreUseCase({required this.repository});

  Future<Either<Failure, ShowStoreEntity>> call({
    required ShowStoreParams params,
  }) {
    return repository.showStore(
      params: params,
    );
  }
}

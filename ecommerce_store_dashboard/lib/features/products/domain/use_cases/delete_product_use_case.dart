import 'package:dartz/dartz.dart';
import 'package:ecommerce_store_dashboard/features/products/domain/entities/delete_product_entity/delete_product_entity.dart';

import '../../../../core/databases/errors/failure.dart';
import '../../../../core/databases/params/params.dart';
import '../repository/products_repository.dart';

class DeleteProductUseCase {
  final ProductsRepository repository;

  DeleteProductUseCase({required this.repository});

  Future<Either<Failure, DeleteProductEntity>> call({
    required DeleteProductParams params,
  }) {
    return repository.deleteProduct(
      params: params,
    );
  }
}

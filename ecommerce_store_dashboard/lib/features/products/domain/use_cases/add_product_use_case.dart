import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../../../../core/databases/params/params.dart';
import '../entities/add_products_entities/add_product_entity.dart';
import '../repository/products_repository.dart';

class AddProduct {
  final ProductsRepository repository;

  AddProduct({required this.repository});

  Future<Either<Failure, AddProductEntity>> call({
    required AddProductParams params,
    required Map<String, dynamic> body,
  }) {
    return repository.addProduct(
      params: params,
      body: body,
    );
  }
}

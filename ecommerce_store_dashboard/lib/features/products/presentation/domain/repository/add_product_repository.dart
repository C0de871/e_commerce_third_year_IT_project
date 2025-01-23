import 'package:dartz/dartz.dart';

import '../../../../../core/databases/errors/failure.dart';
import '../../../../../core/databases/params/params.dart';
import '../entities/add_product_entity.dart';

abstract class AddProductRepository {
  Future<Either<Failure, AddProductEntity>> addProduct({
    required AddProductParams params,
    required Map<String, dynamic> body,
  });
}

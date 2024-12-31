import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/features/products/domain/entities/get_all_products_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, GetAllProductsEntity>> getAllProducts({required ProductParams params});
}

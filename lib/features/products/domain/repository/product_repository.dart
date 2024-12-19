import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/params/params.dart';
import 'package:e_commerce/features/products/domain/entities/product_enitty.dart';
import 'package:e_commerce/features/user/domain/entites/user_entities/user_entities.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getAllProducts({required ProductParams params});
}

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/features/products/domain/entities/get_all_products_entity.dart';
import 'package:e_commerce/features/products/domain/repository/product_repository.dart';

class GetAllProducts {
  final ProductRepository productRepository;
  GetAllProducts({required this.productRepository});

  Future<Either<Failure, GetAllProductsEntity>> call(
      {required ProductParams params}) {
    return productRepository.getAllProducts(params: params);
  }
}

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/features/products/domain/entities/product_enitty.dart';
import 'package:e_commerce/features/products/domain/repository/product_repository.dart';
import 'package:e_commerce/features/user/domain/entites/user_entities/user_entities.dart';

class GetAllProducts {
  final ProductRepository productRepository;
  GetAllProducts({required this.productRepository});

  Future<Either<Failure, List<ProductEntity>>> call({required ProductParams params}) {
    return productRepository.getAllProducts(params: params);
  }
}

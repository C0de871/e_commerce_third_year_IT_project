import 'package:dartz/dartz.dart';
import 'package:ecommerce_store_dashboard/features/products/domain/entities/delete_product_entity/delete_product_entity.dart';
import 'package:ecommerce_store_dashboard/features/products/domain/entities/show_store_entities/show_store_entity.dart';

import '../../../../core/databases/errors/failure.dart';
import '../../../../core/databases/params/params.dart';
import '../entities/add_products_entities/add_product_entity.dart';

abstract class ProductsRepository {
  Future<Either<Failure, AddProductEntity>> addProduct({
    required AddProductParams params,
    required Map<String, dynamic> body,
  });

  Future<Either<Failure, ShowStoreEntity>> showStore({
    required ShowStoreParams params,
  });

  Future<Either<Failure, DeleteProductEntity>> deleteProduct({
    required DeleteProductParams params,
  });
}

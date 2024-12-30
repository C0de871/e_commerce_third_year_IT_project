import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../../../../core/databases/params/params.dart';
import '../entities/get_product_details_entity.dart';

abstract class GetProductDetailsRepository {
  Future<Either<Failure, GetProductDetailsEntity>> getProductDetails(
      {required GetProductDetailsParams params});
}

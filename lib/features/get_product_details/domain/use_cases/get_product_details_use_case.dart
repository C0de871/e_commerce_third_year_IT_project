import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../../../../core/databases/params/params.dart';
import '../entities/get_product_details_entity.dart';
import '../repository/get_product_details_repository.dart';

class GetProductDetails {
  final GetProductDetailsRepository repository;

  GetProductDetails({required this.repository});

  Future<Either<Failure, GetProductDetailsEntity>> call(
      {required GetProductDetailsParams params}) {
    return repository.getProductDetails(params: params);
  }
}

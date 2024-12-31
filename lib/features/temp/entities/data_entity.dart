import 'pagination_entity.dart';
import 'product_entity.dart';

class DataEntity {
  final List<ProductEntity>? products;

  DataEntity({this.products});
}

class GetAllProductsEntity {
  final bool? successful;
  final String? message;
  final DataEntity? data;
  final PaginationEntity? pagination;
  final int? statusCode;

  GetAllProductsEntity({
    this.successful,
    this.message,
    this.data,
    this.pagination,
    this.statusCode,
  });
}

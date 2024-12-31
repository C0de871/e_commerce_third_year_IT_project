import 'data_entity.dart';
import 'pagination_entity.dart';

class GetAllProductsEntity {
  final bool? successful;
  final String? message;
  final DataEntity? data;
  final PaginationEntity? pagination;
  final int? statusCode;

  const GetAllProductsEntity({
    this.successful,
    this.message,
    this.data,
    this.pagination,
    this.statusCode,
  });
}

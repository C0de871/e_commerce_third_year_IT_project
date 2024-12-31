import 'data_entity.dart';
import 'pagination_entity.dart';

class GetAllProductsEntity {
  final DataEntity? data;
  final PaginationEntity? pagination;

  const GetAllProductsEntity({
    this.data,
    this.pagination,
  });
}

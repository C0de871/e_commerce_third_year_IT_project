import '../../../../core/shared/domain/entities/pagination_entity.dart';
import 'data_entity.dart';

class GetAllProductsEntity {
  final DataEntity? data;
  final PaginationEntity? pagination;

  const GetAllProductsEntity({
    this.data,
    this.pagination,
  });
}

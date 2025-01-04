import 'package:e_commerce/features/stores/domain/entities/store_data_entity.dart';

import '../../../../core/shared/domain/entities/pagination_entity.dart';

class GetStoresEntity {
  final StoresDataEntity data;
  final PaginationEntity pagination;

  GetStoresEntity({
    required this.data,
    required this.pagination,
  });
}

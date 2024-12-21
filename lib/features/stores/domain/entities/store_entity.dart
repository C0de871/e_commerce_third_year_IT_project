// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/features/stores/domain/entities/pagination_entity.dart';

class StoreEntity {
  int id;
  String managerName;
  String storeName;
  String imageUrl;
  String location;
  String description;
  PaginationEntity pagination;
  StoreEntity({
    required this.id,
    required this.managerName,
    required this.storeName,
    required this.imageUrl,
    required this.location,
    required this.description,
    required this.pagination,
  });
}

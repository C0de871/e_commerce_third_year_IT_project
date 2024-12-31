import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/shared/domain/entities/pagination_entity.dart';

class PaginationModel extends PaginationEntity {
  PaginationModel({
    required super.currentPage,
    required super.totalPage,
    required super.hasMorePage,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      currentPage: json[ApiKey.currentPage],
      totalPage: json[ApiKey.totalPages],
      hasMorePage: json[ApiKey.hasMorePage],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.currentPage: currentPage,
      ApiKey.totalPages: currentPage,
      ApiKey.hasMorePage: currentPage,
    };
  }
}

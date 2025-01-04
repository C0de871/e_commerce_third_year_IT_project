import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/shared/data/models/pagination_model.dart';
import 'package:e_commerce/features/stores/domain/entities/git_stores_entity.dart';

import 'store_data_model.dart';

class GetStoresModel extends GetStoresEntity {
  bool? successful;
  String? message;
  int? statusCode;

  GetStoresModel({
    required this.successful,
    required this.message,
    required super.data,
    required this.statusCode,
    required super.pagination,
  });

  factory GetStoresModel.fromMap(Map<String, dynamic> data) => GetStoresModel(
        successful: data[ApiKey.successful],
        message: data[ApiKey.message],
        data: StoresDataModel.fromMap(data[ApiKey.data]),
        statusCode: data[ApiKey.statusCode],
        pagination: PaginationModel.fromMap(data[ApiKey.pagination]),
      );

  Map<String, dynamic> toMap() => {
        ApiKey.successful: successful,
        ApiKey.message: message,
        ApiKey.data: (data as StoresDataModel).toMap(),
        ApiKey.statusCode: statusCode,
        ApiKey.successful: (pagination as PaginationModel).toJson(),
      };
}

import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/shared/data/models/pagination_model.dart';
import 'package:e_commerce/features/stores/domain/entities/store_entity.dart';

class StoreModel extends StoreEntity {
  StoreModel({
    required super.id,
    required super.managerName,
    required super.storeName,
    required super.imageUrl,
    required super.location,
    required super.description,
    required super.pagination,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      id: json[ApiKey.id],
      managerName: json[ApiKey.manager],
      storeName: json[ApiKey.storeName],
      imageUrl: json[ApiKey.imageUrl],
      location: json[ApiKey.location],
      description: json[ApiKey.description],
      pagination: PaginationModel.fromJson(json[ApiKey.pagination]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.id: id,
      ApiKey.manager: managerName,
      ApiKey.storeName: storeName,
      ApiKey.imageUrl: imageUrl,
      ApiKey.location: location,
      ApiKey.description: description,
      //! to json
      ApiKey.pagination: (pagination as PaginationModel).toJson(),
    };
  }
}

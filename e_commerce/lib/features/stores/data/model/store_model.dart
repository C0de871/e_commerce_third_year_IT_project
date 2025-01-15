import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/stores/domain/entities/store_entity.dart';

class StoreModel extends StoreEntity {
  StoreModel({
    required super.id,
    required super.manager,
    required super.name,
    required super.imageUrl,
    required super.location,
    required super.description,
  });

  factory StoreModel.fromMap(Map<String, dynamic> data) => StoreModel(
        id: data[ApiKey.id],
        manager: data[ApiKey.manager],
        name: data[ApiKey.name],
        imageUrl: data[ApiKey.imageUrl],
        location: data[ApiKey.location],
        description: data[ApiKey.description],
      );

  Map<String, dynamic> toMap() => {
        ApiKey.id: id,
        ApiKey.manager: manager,
        ApiKey.name: name,
        ApiKey.imageUrl: imageUrl,
        ApiKey.location: location,
        ApiKey.description: description,
      };
}

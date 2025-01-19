import 'package:e_commerce/features/get_store_details/domain/entities/show_store_entities/store_details_data_entity.dart';

import '../../../../../core/databases/api/end_points.dart';
import 'store_product_model.dart';

class StoreDetailsDataModel extends StoreDetailsDataEntity {
  StoreDetailsDataModel({
    required super.id,
    required super.manager,
    required super.name,
    required super.imageUrl,
    required super.location,
    required super.description,
    required super.products,
  });

  factory StoreDetailsDataModel.fromMap(Map<String, dynamic> data) =>
      StoreDetailsDataModel(
        id: data[ApiKey.id] as int,
        manager: data[ApiKey.manager] as String,
        name: data[ApiKey.name] as String,
        imageUrl: data[ApiKey.imageUrl] as String,
        location: data[ApiKey.location] as String,
        description: data[ApiKey.description] as String,
        products: (data[ApiKey.products] as List<dynamic>)
            .map((e) => StoreProductModel.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        ApiKey.id: id,
        ApiKey.manager: manager,
        ApiKey.name: name,
        ApiKey.imageUrl: imageUrl,
        ApiKey.location: location,
        ApiKey.description: description,
        ApiKey.products:
            products.map((e) => (e as StoreProductModel).toMap()).toList(),
      };

  StoreDetailsDataModel copyWith({
    int? id,
    String? manager,
    String? name,
    String? imageUrl,
    String? location,
    String? description,
    List<StoreProductModel>? products,
  }) {
    return StoreDetailsDataModel(
      id: id ?? this.id,
      manager: manager ?? this.manager,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      location: location ?? this.location,
      description: description ?? this.description,
      products: products ?? this.products,
    );
  }
}

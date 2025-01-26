

import '../../../../../core/databases/api/end_points.dart';
import '../../../domain/entities/show_store_entities/show_store_entity.dart';
import 'products_model.dart';

class ShowStoreModel extends ShowStoreEntity {
  ShowStoreModel({
    required super.id,
    required super.manager,
    required super.email,
    required super.phoneNumber,
    required super.name,
    required super.imageUrl,
    required super.location,
    required super.description,
    required super.products,
  });

  // Factory method to map from JSON
  factory ShowStoreModel.fromMap(Map<String, dynamic> map) {
    final storeData = map[ApiKey.data][0];
    return ShowStoreModel(
      id: storeData[ApiKey.id],
      manager: storeData[ApiKey.manager],
      email: storeData[ApiKey.email],
      phoneNumber: storeData[ApiKey.phoneNumber],
      name: storeData[ApiKey.name],
      imageUrl: storeData[ApiKey.imageUrl],
      location: storeData[ApiKey.location],
      description: storeData[ApiKey.description],
      products: List<ProductsModel>.from(storeData[ApiKey.products]?.map((x) => ProductsModel.fromMap(x))),
    );
  }

  // Method to copy the StoreModel with changes
  ShowStoreModel copyWith({
    int? id,
    String? manager,
    String? email,
    String? phoneNumber,
    String? name,
    String? imageUrl,
    String? location,
    String? description,
    List<ProductsModel>? products,
  }) {
    return ShowStoreModel(
      id: id ?? this.id,
      manager: manager ?? this.manager,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      location: location ?? this.location,
      description: description ?? this.description,
      products: products ?? this.products,
    );
  }
}

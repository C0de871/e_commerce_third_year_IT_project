import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/stores/domain/entities/store_data_entity.dart';

import 'store_model.dart';

class StoresDataModel extends StoresDataEntity {
  StoresDataModel({
    required super.stores,
  });

  factory StoresDataModel.fromMap(Map<String, dynamic> data) => StoresDataModel(
        stores: (data[ApiKey.stores] as List)
            .map((e) => StoreModel.fromMap(e))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        ApiKey.stores: stores.map((e) => (e as StoreModel).toMap()).toList(),
      };
}



import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/get_store_details/domain/entities/show_store_entities/show_store_entity.dart';

import 'store_details_data_model.dart';

class ShowStoreModel extends ShowStoreEntity {
  bool successful;
  String message;
  int statusCode;

  ShowStoreModel({
    required this.successful,
    required this.message,
    required super.data,
    required this.statusCode,
  });

  factory ShowStoreModel.fromMap(Map<String, dynamic> data) {
    return ShowStoreModel(
      successful: data[ApiKey.successful] as bool,
      message: data[ApiKey.message] as String,
      data: (data[ApiKey.data] as List<dynamic>).map((e) => StoreDetailsDataModel.fromMap(e as Map<String, dynamic>)).toList(),
      statusCode: data[ApiKey.statusCode] as int,
    );
  }

  Map<String, dynamic> toMap() => {
        ApiKey.successful: successful,
        ApiKey.message: message,
        ApiKey.data: data.map((e) => (e as StoreDetailsDataModel).toMap()).toList(),
        ApiKey.statusCode: statusCode,
      };

  ShowStoreModel copyWith({
    bool? successful,
    String? message,
    List<StoreDetailsDataModel>? data,
    int? statusCode,
  }) {
    return ShowStoreModel(
      successful: successful ?? this.successful,
      message: message ?? this.message,
      data: data ?? this.data,
      statusCode: statusCode ?? this.statusCode,
    );
  }
}

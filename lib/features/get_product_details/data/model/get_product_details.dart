import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/get_product_details/data/model/data_model.dart';

import '../../domain/entities/get_product_details_entity.dart';

class GetProductDetailsModel extends GetProductDetailsEntity {
  bool? successful;
  String? message;
  int? statusCode;

  GetProductDetailsModel({
    this.successful,
    this.message,
    super.data,
    this.statusCode,
  });

  factory GetProductDetailsModel.fromMap(Map<String, dynamic> data) {
    return GetProductDetailsModel(
      successful: data[ApiKey.successful] as bool?,
      message: data[ApiKey.message] as String?,
      data: data[ApiKey.data] == null
          ? null
          : DataModel.fromMap(
              data[ApiKey.data] as Map<String, dynamic>,
            ),
      statusCode: data[ApiKey.statusCode] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        ApiKey.successful: successful,
        ApiKey.message: message,
        ApiKey.data: (data as DataModel?)?.toMap(),
        ApiKey.statusCode: statusCode,
      };

  GetProductDetailsModel copyWith({
    bool? successful,
    String? message,
    DataModel? data,
    int? statusCode,
  }) {
    return GetProductDetailsModel(
      successful: successful ?? this.successful,
      message: message ?? this.message,
      data: data ?? this.data,
      statusCode: statusCode ?? this.statusCode,
    );
  }
}

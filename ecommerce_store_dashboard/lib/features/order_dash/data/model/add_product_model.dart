import '../../../../core/databases/api/end_points.dart';
import '../../domain/entities/add_product_entity.dart';

class AddProductModel extends AddProductEntity {
  AddProductModel({
    required super.successful,
    required super.message,
    required super.data,
    required super.statusCode,
  });

  AddProductModel copyWith({
    bool? successful,
    String? message,
    List? data,
    int? statusCode,
  }) {
    return AddProductModel(
      successful: successful ?? this.successful,
      message: message ?? this.message,
      data: data ?? this.data,
      statusCode: statusCode ?? this.statusCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ApiKey.successful: successful,
      ApiKey.message: message,
      ApiKey.data: data,
      ApiKey.statusCode: statusCode,
    };
  }

  factory AddProductModel.fromMap(Map<String, dynamic> map) {
    return AddProductModel(
      successful: map[ApiKey.successful] as bool,
      message: map[ApiKey.message] as String,
      data: map[ApiKey.data] as List,
      statusCode: map[ApiKey.statusCode] as int,
    );
  }
}

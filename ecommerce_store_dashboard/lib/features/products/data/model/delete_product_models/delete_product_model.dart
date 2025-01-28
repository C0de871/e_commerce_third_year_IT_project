
import '../../../../../core/databases/api/end_points.dart';
import '../../../domain/entities/delete_product_entity/delete_product_entity.dart';

class DeleteProductModel extends DeleteProductEntity {
  DeleteProductModel({
    required super.successful,
    required super.message,
    required super.statusCode,
  });

  factory DeleteProductModel.fromMap(Map<String, dynamic> data) {
    return DeleteProductModel(
      successful: data[ApiKey.successful] as bool?,
      message: data[ApiKey.message] as String?,
      statusCode: data[ApiKey.statusCode] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        ApiKey.successful: successful,
        ApiKey.message: message,
        ApiKey.statusCode: statusCode,
      };

  DeleteProductModel copyWith({
    bool? successful,
    String? message,
    int? statusCode,
  }) {
    return DeleteProductModel(
      successful: successful ?? this.successful,
      message: message ?? this.message,
      statusCode: statusCode ?? this.statusCode,
    );
  }
}

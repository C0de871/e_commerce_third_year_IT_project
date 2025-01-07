import 'dart:convert';

import 'package:e_commerce/features/products/domain/entities/get_all_products_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/databases/api/end_points.dart';
import 'data_model.dart';
import '../../../../core/shared/data/models/pagination_model.dart';

class GetAllProductsModel extends GetAllProductsEntity with EquatableMixin {
  final bool? successful;
  final String? message;
  final int? statusCode;
  GetAllProductsModel({
    this.successful,
    this.message,
    super.data,
    super.pagination,
    this.statusCode,
  });

  factory GetAllProductsModel.fromMap(Map<String, dynamic> data) {
    return GetAllProductsModel(
      successful: data[ApiKey.successful] as bool?,
      message: data[ApiKey.message] as String?,
      data: data[ApiKey.data] == null ? null : DataModel.fromMap(data[ApiKey.data] as Map<String, dynamic>),
      pagination: data[ApiKey.pagination] == null ? null : PaginationModel.fromMap(data[ApiKey.pagination] as Map<String, dynamic>),
      statusCode: data[ApiKey.statusCode] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        ApiKey.successful: successful,
        ApiKey.message: message,
        ApiKey.data: (data as DataModel).toMap(),
        ApiKey.pagination: (pagination as PaginationModel).toMap(),
        ApiKey.statusCode: statusCode,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetAllProductsModel].
  factory GetAllProductsModel.fromJson(String data) {
    return GetAllProductsModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GetAllProductsModel] to a JSON string.
  String toJson() => json.encode(toMap());

  GetAllProductsModel copyWith({
    bool? successful,
    String? message,
    DataModel? data,
    PaginationModel? pagination,
    int? statusCode,
  }) {
    return GetAllProductsModel(
      successful: successful ?? this.successful,
      message: message ?? this.message,
      data: data ?? this.data,
      pagination: pagination ?? this.pagination,
      statusCode: statusCode ?? this.statusCode,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      successful,
      message,
      data,
      pagination,
      statusCode,
    ];
  }
}

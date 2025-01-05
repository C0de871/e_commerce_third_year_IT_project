
import 'package:collection/collection.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/favorites/domain/entities/get_fav_list_entity/get_fav_list_entity.dart';

import 'data_model.dart';

class GetFavListModel extends GetFavListEntity{
  bool? successful;
  String? message;
  int? statusCode;

  GetFavListModel({
    this.successful,
    this.message,
    super.data,
    this.statusCode,
  });

  factory GetFavListModel.fromMap(Map<String, dynamic> map) => GetFavListModel(
        successful: map[ApiKey.successful] as bool?,
        message: map[ApiKey.message] as String?,
        data: (map[ApiKey.data] as List<dynamic>?)
            ?.map((e) => DataModel.fromMap(e as Map<String, dynamic>))
            .toList(),
        statusCode: map[ApiKey.statusCode] as int?,
      );

  Map<String, dynamic> toMap() => {
        ApiKey.successful: successful,
        ApiKey.message: message,
        ApiKey.data: data?.map((e) => (e as DataModel).toMap()).toList(),
        ApiKey.statusCode: statusCode,
      };

  GetFavListModel copyWith({
    bool? successful,
    String? message,
    List<DataModel>? data,
    int? statusCode,
  }) {
    return GetFavListModel(
      successful: successful ?? this.successful,
      message: message ?? this.message,
      data: data ?? this.data,
      statusCode: statusCode ?? this.statusCode,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GetFavListModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      successful.hashCode ^ message.hashCode ^ data.hashCode ^ statusCode.hashCode;
}

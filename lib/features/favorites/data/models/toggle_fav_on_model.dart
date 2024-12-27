import 'dart:convert';

import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/favorites/domain/entities/toggle_fav_on_entitiy.dart';

class ToggleFavOnModel extends ToggleFavOnEntity {
  ToggleFavOnModel({
    required super.success,
    required super.message,
  });

  factory ToggleFavOnModel.fromMap(Map<String, dynamic> data) {
    return ToggleFavOnModel(
      success: data[ApiKey.success],
      message: data[ApiKey.message],
    );
  }

  Map<String, dynamic> toMap() => {
        ApiKey.success: success,
        ApiKey.message: message,
      };

  // /// `dart:convert`
  // ///
  // /// Parses the string and returns the resulting Json object as [ToggleFavOnModel].
  // factory ToggleFavOnModel.fromJson(String data) {
  //   return ToggleFavOnModel.fromMap(json.decode(data) as Map<String, dynamic>);
  // }

  // /// `dart:convert`
  // ///
  // /// Converts [ToggleFavOnModel] to a JSON string.
  // String toJson() => json.encode(toMap());

  ToggleFavOnModel copyWith({
    bool? success,
    String? message,
  }) {
    return ToggleFavOnModel(
      success: success ?? this.success,
      message: message ?? this.message,
    );
  }
}

import 'dart:convert';

import '../../../../core/databases/api/end_points.dart';
import '../../domain/entities/sub_image_entity.dart';

class SubImageModel extends SubImageEntity {
  SubImageModel({super.id, super.image});

  factory SubImageModel.fromMap(Map<String, dynamic> data) => SubImageModel(
        id: data[ApiKey.id] as int?,
        image: data[ApiKey.image] as String?,
      );

  Map<String, dynamic> toMap() => {
        ApiKey.id: id,
        ApiKey.image: image,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SubImageModel].
  factory SubImageModel.fromJson(String data) {
    return SubImageModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SubImageModel] to a JSON string.
  String toJson() => json.encode(toMap());

  SubImageModel copyWith({
    int? id,
    String? image,
  }) {
    return SubImageModel(
      id: id ?? this.id,
      image: image ?? this.image,
    );
  }
}

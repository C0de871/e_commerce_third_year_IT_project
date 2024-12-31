import 'dart:convert';

import '../../domain/entities/sub_image_entity.dart';

class SubImageModel extends SubImageEntity {
  int? id;
  String? image;

  SubImageModel({this.id, this.image});

  factory SubImageModel.fromMap(Map<String, dynamic> data) => SubImageModel(
        id: data['id'] as int?,
        image: data['image'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'image': image,
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

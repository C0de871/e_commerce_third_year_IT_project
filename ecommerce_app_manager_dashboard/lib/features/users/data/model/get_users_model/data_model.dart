import 'dart:convert';

import '../../../domain/entities/get_users_entity/data_entity.dart';

class DataModel extends DataEntity {
  DataModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.location,
    required super.phoneNumber,
    required super.imageUrl,
    super.role,
  });

  factory DataModel.fromMap(Map<String, dynamic> data) => DataModel(
        id: data['id'] as int,
        firstName: data['first_name'] as String,
        lastName: data['last_name'] as String,
        email: data['email'] as String,
        location: data['location'] as String,
        phoneNumber: data['phone_number'] as String,
        imageUrl: data['image_url'] as String,
        role: data['role'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'location': location,
        'phone_number': phoneNumber,
        'image_url': imageUrl,
        'role': role,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DataModel].
  factory DataModel.fromJson(String data) {
    return DataModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DataModel] to a JSON string.
  String toJson() => json.encode(toMap());

  DataModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? location,
    String? phoneNumber,
    String? imageUrl,
    String? role,
  }) {
    return DataModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      location: location ?? this.location,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      imageUrl: imageUrl ?? this.imageUrl,
      role: role ?? this.role,
    );
  }
}

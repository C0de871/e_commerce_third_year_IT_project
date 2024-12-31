import 'dart:convert';
import 'package:e_commerce/features/temp/entities/data_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../core/databases/api/end_points.dart';
import 'product_model.dart';

class DataModel extends DataEntity with EquatableMixin {
  DataModel({super.products});

  factory DataModel.fromMap(Map<String, dynamic> data) => DataModel(
        products: (data[ApiKey.products] as List<dynamic>?)?.map((e) => ProductModel.fromMap(e as Map<String, dynamic>)).toList(),
      );

  Map<String, dynamic> toMap() => {
        ApiKey.products: products?.map((e) => (e as ProductModel).toMap()).toList(),
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
    List<ProductModel>? products,
  }) {
    return DataModel(
      products: products ?? this.products,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [products];
}

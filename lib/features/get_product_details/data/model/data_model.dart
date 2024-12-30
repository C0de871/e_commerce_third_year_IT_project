
import '../../../../core/databases/api/end_points.dart';
import '../../domain/entities/data_entity.dart';
import 'sub_image_model.dart';

class DataModel extends DataEntity {
  DataModel({
    super.storeId,
    super.storeName,
    super.productId,
    super.productName,
    super.price,
    super.quantity,
    super.description,
    super.mainImage,
    super.subImages,
  });

  factory DataModel.fromMap(Map<String, dynamic> data) => DataModel(
        storeId: data[ApiKey.storeId] as int?,
        storeName: data[ApiKey.storeName] as String?,
        productId: data[ApiKey.productId] as int?,
        productName: data[ApiKey.productName] as String?,
        price: data[ApiKey.price] as String?,
        quantity: data[ApiKey.quantity] as int?,
        description: data[ApiKey.description] as String?,
        mainImage: data[ApiKey.mainImageUrl] as String?,
        subImages: (data[ApiKey.subImages] as List<dynamic>?)?.map((e) => SubImageModel.fromMap(e as Map<String, dynamic>)).toList(),
      );

  Map<String, dynamic> toMap() => {
        ApiKey.storeId: storeId,
        ApiKey.storeName: storeName,
        ApiKey.productId: productId,
        ApiKey.productName: productName,
        ApiKey.price: price,
        ApiKey.quantity: quantity,
        ApiKey.description: description,
        ApiKey.mainImageUrl: mainImage,
        ApiKey.subImages: subImages?.map((e) => (e as SubImageModel).toMap()).toList(),
      };

  DataModel copyWith({
    int? storeId,
    String? storeName,
    int? productId,
    String? productName,
    String? price,
    int? quantity,
    String? description,
    String? mainImage,
    List<SubImageModel>? subImages,
  }) {
    return DataModel(
      storeId: storeId ?? this.storeId,
      storeName: storeName ?? this.storeName,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      description: description ?? this.description,
      mainImage: mainImage ?? this.mainImage,
      subImages: subImages ?? this.subImages,
    );
  }
}

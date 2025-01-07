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
    super.catagoryID,
    super.catagoryName,
    super.isFavorite,
    super.quantityInCart,
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
        catagoryID: data[ApiKey.catagoryID] as int?,
        catagoryName: data[ApiKey.catagoryName] as String?,
        isFavorite: data[ApiKey.isFavorite] as int?,
        quantityInCart: data[ApiKey.quantityInCart] as int?,
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
        ApiKey.catagoryID: catagoryID,
        ApiKey.catagoryName: catagoryName,
        ApiKey.isFavorite: isFavorite,
        ApiKey.quantityInCart: quantityInCart,
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
    int? catagoryID,
    String? catagoryName,
    int? isFavorite,
    int? quantityInCart,
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
      catagoryID: catagoryID ?? this.catagoryID,
      catagoryName: catagoryName ?? this.catagoryName,
      isFavorite: isFavorite ?? this.isFavorite,
      quantityInCart: quantityInCart ?? this.quantityInCart,
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'sub_image_entity.dart';

class DataEntity {
  int? storeId;
  String? storeName;
  int? productId;
  String? productName;
  String? price;
  int? quantity;
  String? description;
  String? mainImage;
  List<SubImageEntity>? subImages;
  int? catagoryID;
  String? catagoryName;
  bool? isFavorite;
  DataEntity({
    this.storeId,
    this.storeName,
    this.productId,
    this.productName,
    this.price,
    this.quantity,
    this.description,
    this.mainImage,
    this.subImages,
    this.catagoryID,
    this.catagoryName,
    this.isFavorite,
  });
}

import 'package:collection/collection.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';

class SubOrderEntity {
  int? id;
  String? orderDate;
  String? status;
  double? totalPrice;
  String? orderReference;
  int? numberOfProducts;
  String? image;

  SubOrderEntity({
    this.id,
    this.orderDate,
    this.status,
    this.totalPrice,
    this.orderReference,
    this.numberOfProducts,
    this.image,
  });


  Map<String, dynamic> toJson() => {
        ApiKey.id: id,
        ApiKey.orderDate: orderDate,
        ApiKey.status: status,
        ApiKey.totalPrice: totalPrice,
        ApiKey.orderReference: orderReference,
        ApiKey.numberOfProducts: numberOfProducts,
        ApiKey.image: image,
      };
}

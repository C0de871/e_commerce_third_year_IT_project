// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/core/databases/api/end_points.dart';

class ToggleFavOnParams {
  final String productID;
  final String storeID;
  ToggleFavOnParams({
    required this.productID,
    required this.storeID,
  });
}

class ProductParams {
  int page = 1;
  ProductParams({required this.page});

  Map<String, dynamic> toJson() {
    return {
      ApiKey.page: page,
    };
  }
}

class StoreParams {
  int page = 1;
  StoreParams({required this.page});

  Map<String, dynamic> toJson() {
    return {
      ApiKey.page: page,
    };
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../api/end_points.dart';

class ToggleFavParams {
  final String productID;
  final String storeID;
  ToggleFavParams({
    required this.productID,
    required this.storeID,
  });
}

class GetProductDetailsParams {
  String productID, storeID;
  GetProductDetailsParams({
    required this.productID,
    required this.storeID,
  });
}

class GetOrderIdParams {
  String orderID;
  GetOrderIdParams({required this.orderID});
}

class ShowStoreParams {
  String storeID;
  ShowStoreParams({
    required this.storeID,
  });
}

class GetStoredAndProductIdParams {
  String productID, storeID;
  GetStoredAndProductIdParams({
    required this.productID,
    required this.storeID,
  });
}

class ProductParams {
  int page = 1;
  String query;
  ProductParams({
    required this.page,
    required this.query,
  });

  Map<String, dynamic> toJson() {
    return {
      ApiKey.page: page,
    };
  }
}

class StoreParams {
  int page = 1;
  String query;
  StoreParams({
    required this.page,
    required this.query,
  });

  Map<String, dynamic> toJson() {
    return {
      ApiKey.page: page,
    };
  }
}

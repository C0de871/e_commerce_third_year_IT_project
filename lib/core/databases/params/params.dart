import 'package:e_commerce/core/databases/api/end_points.dart';

class ToggleFavOnParams {
  final String id;
  ToggleFavOnParams({required this.id});
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

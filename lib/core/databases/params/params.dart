import 'package:e_commerce/core/databases/api/end_points.dart';

class TemplateParams {
  final String id;
  TemplateParams({required this.id});
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

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/core/databases/api/api_consumer.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/databases/cache/cache_helper.dart';
import 'package:e_commerce/features/products/data/model/product_model.dart';

import '../../../../core/params/params.dart';

class ProductRemoteDataSource {
  final ApiConsumer apiConsumer;
  final CacheHelper cacheHelper;

  ProductRemoteDataSource({
    required this.apiConsumer,
    required this.cacheHelper,
  });

  Future<List<ProductModel>> getAllProducts({required ProductParams params}) async {
    Map<String, dynamic> headers = {
      ApiKey.authorization: cacheHelper.getData(key: ApiKey.accessToken),
    };
    final response = await apiConsumer.get(
      EndPoints.getAllProducts,
      queryParameters: params.toJson(),
      headers: headers,
    );
    final List jsonProductsList = response[ApiKey.data][ApiKey.products];
    final List<ProductModel> productList = jsonProductsList.map(
      (jsonProduct) {
        return ProductModel.fromJson(jsonProduct);
      },
    ).toList();
    return productList;
  }
}

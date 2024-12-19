import 'package:e_commerce/core/databases/api/api_consumer.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/databases/cache/cache_helper.dart';
import 'package:e_commerce/features/Home%20common/products%20feature/data/model/product_model.dart';

import '../../../../../core/params/params.dart';

class ProductRemoteDataSource {
  final ApiConsumer apiConsumer;
  final CacheHelper cacheHelper;

  ProductRemoteDataSource(this.cacheHelper, {required this.apiConsumer});

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

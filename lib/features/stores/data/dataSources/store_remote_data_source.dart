import 'package:e_commerce/core/databases/api/api_consumer.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/features/stores/data/model/get_stores_model.dart';

class StoreRemoteDataSource {
  final ApiConsumer api;

  StoreRemoteDataSource({required this.api});
  Future<GetStoresModel> getAllStores({required StoreParams params}) async {
    final response = await api.get(EndPoints.getAllStores, queryParameters: params.toJson());
    return GetStoresModel.fromMap(response);
  }
}

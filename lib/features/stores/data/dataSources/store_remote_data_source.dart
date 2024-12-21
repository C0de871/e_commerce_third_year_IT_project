import 'package:e_commerce/core/databases/api/api_consumer.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/features/stores/data/model/store_model.dart';

class StoreRemoteDataSource {
  final ApiConsumer api;

  StoreRemoteDataSource({required this.api});
  Future<List<StoreModel>> getAllStores({required StoreParams params}) async {
    final response = await api.get(EndPoints.getAllStores, queryParameters: params.toJson());
    final List storesListJson = response[ApiKey.data][ApiKey.stores];
    final List<StoreModel> storesModelList = storesListJson.map((storeJson) => StoreModel.fromJson(storeJson)).toList();
    return storesModelList;
  }
}

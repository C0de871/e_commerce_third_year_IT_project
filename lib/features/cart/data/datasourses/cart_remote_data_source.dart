import 'package:e_commerce/core/databases/api/api_consumer.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/cart/data/models/cart_model.dart';
import 'package:e_commerce/features/cart/data/models/modify_cart_model.dart';
import 'package:e_commerce/features/cart/domain/entites/modify_cart/modify_cart.dart';
import 'package:e_commerce/features/cart/domain/usecases/modify_cart.dart';

class CartRemoteDataSource {
  final ApiConsumer api;

  CartRemoteDataSource({required this.api});

  Future<CartModel> getCart() async {
    final response = await api.get(
      EndPoints.getCart,
    );
    return CartModel.fromJson(response);
  }

  Future <List<ModifyCartModel>> modifyCart(Map<String,dynamic> bodyJson ) async {
    final response = await api.post(
      data: bodyJson,
      EndPoints.modifyCart,
    );
    return response.map((item){
  return ModifyCartModel.fromJson(item).toEntity();
    }).toList();

  }

  String noInternectConnection() {
    return "NO Internet connection";
  }

}

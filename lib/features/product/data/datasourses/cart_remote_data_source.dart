import 'package:e_commerce/core/databases/api/api_consumer.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/product/data/models/cart_model.dart';

class CartRemoteDataSource {
  final ApiConsumer api;

  CartRemoteDataSource({required this.api});

  Future<CartModel> getCart() async {
    final response = await api.post(
      EndPoints.getCart,
    );
    return CartModel.fromJson(response);
  }
  String noInternectConnection() {
    return "NO Internet connection";
  }
}

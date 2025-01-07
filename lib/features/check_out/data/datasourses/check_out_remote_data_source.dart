import 'package:e_commerce/core/databases/api/api_consumer.dart';

class CheckOutRemoteDataSource {
  final ApiConsumer api;

  CheckOutRemoteDataSource({required this.api});
// //! get cart:
//   Future<CartModel> getCart() async {
//     final response = await api.get(
//       EndPoints.getCart,
//     );
//     return CartModel.fromJson(response);
//   }
// //! confirm modify products:
//   Future<List<ModifyCartModel>> modifyCart(
//       Map<String, dynamic> bodyJson) async {
//     final response = await api.post(
//       data: bodyJson,
//       EndPoints.modifyCart,
//     );
//     return response.map((item) {
//       return ModifyCartModel.fromJson(item).toEntity();
//     }).toList();
//   }
// //! confirm delete products:
// Future<MessageModel> deleteCart(
//       Map<String, dynamic> bodyJson) async {
//     final response = await api.delete(
//       data: bodyJson,
//       EndPoints.deleteCart,
//     );

//       return MessageModel.fromJson(response);

//   }
//   String noInternectConnection() {
//     return "NO Internet connection";
//   }
// //! clear Cart:
// Future<MessageModel> clearCart() async {
//     final response = await api.delete(
//       EndPoints.clearCart,
//     );
//       return MessageModel.fromJson(response);
//   }
}

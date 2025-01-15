import 'dart:math';

import 'package:e_commerce/core/databases/api/api_consumer.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/databases/cache/secure_storage_helper.dart';
import 'package:e_commerce/features/cart/data/models/sub_cart/sub_cart_model.dart';
import 'package:e_commerce/features/cart/domain/entites/cart_entity/sub_cart_entity.dart';
import 'package:e_commerce/features/check_out/data/models/check_out_order_model.dart';

class CheckOutRemoteDataSource {
  final ApiConsumer api;
  final SecureStorageHelper cacheHelper;
  CheckOutRemoteDataSource({required this.cacheHelper, required this.api});
//! create order:
Future<CheckOutOrderModel> createOrder( {required Map<String,dynamic> bodyJson
  } )async{
    String? accessToken = await cacheHelper.getData(key: CacheKey.accessToken);

    Map<String, dynamic> headers = {
      ApiKey.authorization: accessToken,
    };
    bool isLoggedIn = (accessToken != null) ? true : false;

    Map<String, dynamic> extra = {
      ApiKey.requiredAuth: true,
    };
    final response =
        await api.post(EndPoints.createOrder, headers: headers, extra: extra,data:bodyJson);
    return CheckOutOrderModel.fromJson(response);
  }
String noInternectConnection() {
    return "NO Internet connection";
  }

}
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


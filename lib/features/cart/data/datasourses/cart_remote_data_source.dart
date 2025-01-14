import 'package:e_commerce/core/databases/api/api_consumer.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/databases/cache/secure_storage_helper.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/core/shared/data/models/message_model.dart';
import 'package:e_commerce/features/cart/data/models/add_to_cart_model.dart';
import 'package:e_commerce/features/cart/data/models/cart_model.dart';
import 'package:e_commerce/features/cart/data/models/size_cart_model.dart';
import 'package:e_commerce/features/cart/domain/entites/cart_entity.dart';

class CartRemoteDataSource {
  final ApiConsumer api;
  final SecureStorageHelper cacheHelper;
  CartRemoteDataSource({
    required this.api,
    required this.cacheHelper,
  });
//! get cart:
  Future<CartModel> getCart() async {
    String? accessToken = await cacheHelper.getData(key: CacheKey.accessToken);

    Map<String, dynamic> headers = {
      ApiKey.authorization: accessToken,
    };
    bool isLoggedIn = (accessToken != null) ? true : false;

    Map<String, dynamic> extra = {
      ApiKey.requiredAuth: isLoggedIn,
    };
    final response =
        await api.get(EndPoints.getCart, headers: headers, extra: extra);
    return CartModel.fromJson(response);
  }

//! confirm modify products:
  Future<CartEntity> modifyCart(
      Map<String, dynamic> bodyJson) async {
    String? accessToken = await cacheHelper.getData(key: CacheKey.accessToken);

    Map<String, dynamic> headers = {
      ApiKey.authorization: accessToken,
    };
    bool isLoggedIn = (accessToken != null) ? true : false;

    Map<String, dynamic> extra = {
      ApiKey.requiredAuth: isLoggedIn,
    };
    final response = await api.put(
        data: bodyJson, EndPoints.modifyCart, headers: headers, extra: extra);
    return CartModel.fromJson(response);
  }

//! confirm delete products:
  Future<MessageModel> deleteCart(Map<String, dynamic> bodyJson) async {
    String? accessToken = await cacheHelper.getData(key: CacheKey.accessToken);

    Map<String, dynamic> headers = {
      ApiKey.authorization: accessToken,
    };
    bool isLoggedIn = (accessToken != null) ? true : false;

    Map<String, dynamic> extra = {
      ApiKey.requiredAuth: isLoggedIn,
    };
    final response = await api.delete(
        data: bodyJson, EndPoints.deleteCart, headers: headers, extra: extra);

    return MessageModel.fromJson(response);
  }

  String noInternectConnection() {
    return "NO Internet connection";
  }

//! clear Cart:
  Future<MessageModel> clearCart() async {
    String? accessToken = await cacheHelper.getData(key: CacheKey.accessToken);

    Map<String, dynamic> headers = {
      ApiKey.authorization: accessToken,
    };
    bool isLoggedIn = (accessToken != null) ? true : false;

    Map<String, dynamic> extra = {
      ApiKey.requiredAuth: isLoggedIn,
    };
    final response =
        await api.delete(EndPoints.clearCart, headers: headers, extra: extra);
    return MessageModel.fromJson(response);
  }
  //! get size:
  Future<SizeCartModel> getSizeCart() async {
    String? accessToken = await cacheHelper.getData(key: CacheKey.accessToken);

    Map<String, dynamic> headers = {
      ApiKey.authorization: accessToken,
    };

    Map<String, dynamic> extra = {
      ApiKey.requiredAuth: true,
    };
    final response =
        await api.get(EndPoints.getSizeCart, headers: headers, extra: extra);
    return SizeCartModel.fromJson(response);
  }
  //! add to cart :
Future<AddToCartModel> addToCart(GetStoredAndProductIdParams params,Map<String,dynamic> bodyJson) async {
    String? accessToken = await cacheHelper.getData(key: CacheKey.accessToken);

    Map<String, dynamic> headers = {
      ApiKey.authorization: accessToken,
    };
    bool isLoggedIn = (accessToken != null) ? true : false;

    Map<String, dynamic> extra = {
      ApiKey.requiredAuth: true,
    };
    final response =
        await api.post(EndPoints.getProductStoredId(params),data: bodyJson,headers: headers, extra: extra);
    return AddToCartModel.fromJson(response);
  } 
}

import '../params/params.dart';

class EndPoints {
  static const String baserUrl = "http://192.168.1.7:8000/api/";
  static const String login = "login";
  static const String signUp = "register";
  static const String toggleFavOn = "favorites/";
  static const String toggleFavOff = "favorites/";
  static const String otpResend = "resend-otp";
  static const String otpValidate = "validate-otp";
  static const String getAllProducts = "products";
  static const String getAllStores = "stores";
  static const String refreshToken = "refresh";
  static const String favList = "favorites";

  static const String getCart = "carts/products/0";
  static const String modifyCart = "carts/update-quantities";
  static const String deleteCart = "carts/delete-products";
  static const String clearCart = "carts/delete-all";
  static const String getSizeCart = "carts/getSize";
  static const String createOrder = "orders/create";
  static const String getOrder = "orders";

  static String addProduct(int storeID) {
    return "stores/$storeID/products";
  }

  static String showStoreAndProducts(int storeID) {
    return "stores/$storeID/show";
  }

  static String deleteProduct(int storeID, int productID) {
    return "stores/$storeID/$productID/delete";
  }
}

class ApiKey {
  static String nameEn = "name_en";
  static String categoryNameEn = "category_name_en";
  static String mainImage = "main_image";
  static String price = "price";
  static String quantity = "quantity";
  static String descriptionEn = "description_en";
  static String nameAr = "name_ar";
  static String categoryNameAr = "category_name_ar";
  static String descriptionAr = "description_ar";
  static String subImages(int id) {
    return "sub_images[$id]";
  }

  static String success = "success";
  static String refreshTokenHeader = "Refresh-Token";
  static String requiredAuth = "requiresAuth";
  static String successful = "successful";
  static String otp = "otp";
  static String id = "id";
  static String message = "message";
  static String statusCode = "status_code";
  static String email = "email";
  static String accessToken = "access_token";
  static String refreshToken = "refresh_token";
  static String user = "user";
  static String password = "password";
  static String deviceId = "Device-ID";
  static String firstName = "first_name";
  static String lastName = "last_name";
  static String phoneNumber = "phone_number";
  static String address = "location";
  static String image = "image";
  static String emailVerfiedAt = "email_verified_at";
  static String location = "location";
  static String fcmToken = "fcm_token";
  static String deletedAt = "deleted_at";
  static String createdAt = "created_at";
  static String updatedAt = "updated_at";
  static String data = "data";
  static String expiresIn = "expires_in";
  static String storeId = "store_id";
  static String stores = "stores";
  static String storeName = "store_name";
  static String productId = "product_id";
  static String productName = "product_name";

  static String description = "description";
  static String mainImageUrl = "main_image";
  static String isFavorite = "is_favorite";
  static String page = "page";
  static String manager = "manager";
  static String name = "name";
  static String imageUrl = "image_url";
  static String orderQuantity = "order_quantity";
  static String authorization = "Authorization";
  static String products = "products";
  static String storeProductId = "store_product_id";
  static String pagination = "pagination";
  static String currentPage = "currentPage";
  static String totalPages = "totalPages";
  static String hasMorePage = "hasMorePage";
  static String totalItems = "totalItems";

  static String categoryId = "category_id";

  static String catagoryID = "category_id";
  static String categoryName = "category_name";
  static String quantityInCart = "quantityInCart";
  static String totalPrice = "total_price";
  static String cartAmount = "cart_amount";
  static String orderCount = "order_count";
  static String numberOfProducts = "number_of_products";
  static String orderDate = "order_date";
  static String orderReference = "order_reference";
  static String status = "status";
  static String orders = "orders";
}

class CacheKey {
  static String fcmToken = "fcmToken";
  static String user = "user";
  static String accessToken = "accessToken";
  static String refreshToken = "refreshToken";
  static String isFirstTime = "isFirstTime";
  static String totalPrice = "total_price";
  static String storeId = "store_id";
  static String storeName = "store_name";
  static String orderQuantity = "order_quantity";
  static String storeProductId = "store_product_id";
  static String quantity = "quantity";
  static String price = "price";
  static String description = "description";
  static String productId = "product_id";
  static String productName = "product_name";
  static String mainImage = "main_image";
  static String data = "data";
  static String userLang = "userLang";
}

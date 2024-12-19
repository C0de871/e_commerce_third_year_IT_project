class EndPoints {
  static const String baserUrl = "http://192.168.1.7:8000/api/";
  static const String login = "login";
  static const String signUp = "register";
  static const String template = "template";
  static const String otpResend = "resend-otp";
  static const String otpValidate = "validate-otp";
  static const String getAllProducts = "products";
}

class ApiKey {
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
  static String imageUrl = "image";
  static String emailVerfiedAt = "email_verified_at";
  static String location = "location";
  static String fcmToken = "fcm_token";
  static String deletedAt = "deleted_at";
  static String createdAt = "created_at";
  static String updatedAt = "updated_at";
  static String data = "data";

  static String storeId = "store_id";
  static String storeName = "store_name";
  static String productId = "product_id";
  static String productName = "product_name";
  static String price = "price";
  static String quantity = "quantity";
  static String description = "description";
  static String mainImageUrl = "main_image";
  static String isFavorite = "is_favorite";
  static String page = "page";

  static String authorization = "Authorization";
  static String products = "products";
}

class CacheKey {
  static String fcmToken = "fcmToken";
  static String user = "user";
  static String accessToken = "accessToken";
  static String refreshToken = "refreshToken";
}

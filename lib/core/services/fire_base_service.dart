// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:e_commerce/firebase_options.dart';

import '../databases/cache/cache_helper.dart';
import 'service_locator.dart';

class FireBaseService {
  //create an instance of Firebase Messaging:
  final _firebaseMessaging = FirebaseMessaging.instance;

  final CacheHelper cache;
  FireBaseService() : cache = getIt();

  //initialize app for firebase:
  static Future<void> initializeApp() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  //function to initialize notifications:
  Future<void> initNotifications() async {
    //request premission from user:
    await _firebaseMessaging.requestPermission();

    //fetch the FCM token for this device:
    String fcmToken = await getFCMToken();

    _firebaseMessaging.onTokenRefresh.listen((newToken) {
      cache.saveData(key: CacheKey.fcmToken, value: newToken);
      fcmToken = newToken;
      log("token is refreshed: $newToken");
    });

    //print the token:
    log("Token: $fcmToken");
  }

  Future<String> getFCMToken() async {
    if (cache.getData(key: CacheKey.fcmToken) == null) {
      final fcmToken = await _firebaseMessaging.getToken();
      await cache.saveData(key: CacheKey.fcmToken, value: fcmToken);
      log('token is saved');
      return fcmToken!;
    }
    log('token is retrieve from cache');
    return cache.getData(key: CacheKey.fcmToken);
  }
}

// import 'dart:convert';

// import 'package:e_commerce/core/databases/cache/shared_prefs_helper.dart';
// import 'package:e_commerce/core/databases/errors/expentions.dart';
// import 'package:e_commerce/features/template/data/models/toggle_fav_on_model.dart';

// class ToggleFavOnLocalDataSource {
//   final SharedPrefsHelper cache;
//   final String key = "CachedToggleFavOn";
//   ToggleFavOnLocalDataSource({required this.cache});

//   cacheToggleFavOn(ToggleFavOnModel? toggleFavOnToCache) {
//     if (toggleFavOnToCache != null) {
//       cache.saveData(
//         key: key,
//         value: json.encode(
//           toggleFavOnToCache.toJson(),
//         ),
//       );
//     } else {
//       throw CacheExeption(errorMessage: "No Internet Connection");
//     }
//   }

//   Future<ToggleFavOnModel> getLastToggleFavOn() {
//     final jsonString = cache.getDataString(key: key);

//     if (jsonString != null) {
//       return Future.value(ToggleFavOnModel.fromJson(json.decode(jsonString)));
//     } else {
//       throw CacheExeption(errorMessage: "No Internet Connection");
//     }
//   }
// }

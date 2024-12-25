import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

SystemUiOverlayStyle getSystemUiOverlayStyle(Brightness currentBrightness, BuildContext context) {
  return currentBrightness == Brightness.light
      ? SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Theme.of(context).colorScheme.inversePrimary,
        )
      : SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Theme.of(context).colorScheme.inversePrimary,
        );
}

Future<XFile?> pickImage() async {
  final ImagePicker picker = ImagePicker();
  final image = await picker.pickImage(source: ImageSource.gallery); // or ImageSource.camera
  return image;
}

Future uploadImageToApi(XFile? image) async {
  if (image == null) return null;
  return MultipartFile.fromFile(image.path, filename: image.path.split('/').last);
}

class RouteObserverService extends NavigatorObserver {
  final List<String> routeHistory = [];

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    log('Pushed route: ${route.settings.name}');
    routeHistory.add(route.settings.name ?? 'Unknown');
    printRouteHistory();
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    log('Popped route: ${route.settings.name}');
    routeHistory.removeLast();
    printRouteHistory();
  }

  void printRouteHistory() {
    log('Current navigation stack:');
    for (var route in routeHistory) {
      log(route);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

SystemUiOverlayStyle getSystemUiOverlayStyle(Brightness currentBrightness, BuildContext context) {
  return currentBrightness == Brightness.light
      ? SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Theme.of(context).colorScheme.inversePrimary,
        )
      : SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Theme.of(context).colorScheme.inversePrimary,
        );
}

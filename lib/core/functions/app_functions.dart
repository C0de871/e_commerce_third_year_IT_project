import 'dart:developer';
import 'dart:io';

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

Future<File?> pickImage() async {
  final ImagePicker picker = ImagePicker();
  final image = await picker.pickImage(source: ImageSource.gallery); // or ImageSource.camera
  if (image == null) return null;
  return File(image.path);
}

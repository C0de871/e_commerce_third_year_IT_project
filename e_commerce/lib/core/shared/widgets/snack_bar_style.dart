import 'package:flutter/material.dart';

class SnackbarStyles {
  static final BorderRadius borderRadius = BorderRadius.circular(8.0);

  static const Duration duration = Duration(seconds: 3);

  static const EdgeInsets margin = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 16.0,
  );

  static const EdgeInsets padding = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 12.0,
  );

  static BoxDecoration successDecoration = BoxDecoration(
    color: Colors.green.shade50,
    borderRadius: borderRadius,
    border: Border.all(color: Colors.green.shade200),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ],
  );

  static BoxDecoration errorDecoration = BoxDecoration(
    color: Colors.red.shade50,
    borderRadius: borderRadius,
    border: Border.all(color: Colors.red.shade200),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ],
  );

  static TextStyle titleStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle messageStyle = const TextStyle(
    fontSize: 14,
    color: Colors.black87,
  );
}

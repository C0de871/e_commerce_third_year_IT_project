// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class AddProductEntity {
  bool successful;
  String message;
  List data;
  int statusCode;
  AddProductEntity({
    required this.successful,
    required this.message,
    required this.data,
    required this.statusCode,
  });
}

import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/cart/data/models/modify_cart_model.dart';
import 'package:e_commerce/features/cart/domain/entites/size_cart_entity.dart';
import 'package:flutter/material.dart';

class SizeCartModel extends SizeCartEntity{
SizeCartModel({required super.data});

factory SizeCartModel.fromJson(Map<String, dynamic> json) {
    return SizeCartModel(
      data:json[ApiKey.data] );
  }
}

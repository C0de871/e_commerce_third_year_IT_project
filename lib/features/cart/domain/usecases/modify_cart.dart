import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/features/cart/domain/entites/cart_entity.dart';
import 'package:e_commerce/features/cart/domain/entites/modify_cart/modify_cart.dart';
import 'package:e_commerce/features/cart/domain/repository/cart_repository.dart';

class ModifyCart {
  final CartRepository cartRepository;

  ModifyCart({required this.cartRepository});

  Future<Either<Failure,List<ModifyCartEntity>>> call({
    required Map<String,dynamic> bodyJson}){ return cartRepository.modifyCart(bodyJson: bodyJson);
  }}

  
    
  

import 'package:e_commerce/features/cart/domain/entites/cart_entity/sub_cart_entity.dart';
import 'package:flutter/material.dart';

class OneProduct extends StatelessWidget {
  OneProduct({
    super.key,
    required this.cartItem,
  });
  final SubCartEntity cartItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), 
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.network(
                "${cartItem.mainImage}",
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              "${cartItem.productName}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text("Price: ${cartItem.price}"),
          Text(
            "Total Price: ${((cartItem.orderQuantity ?? 0) * (double.tryParse(cartItem.price ?? '0') ?? 0.0)).toInt()}",
            style: TextStyle(color: Colors.green),
          ),
        ],
      ),
    );
  }
}

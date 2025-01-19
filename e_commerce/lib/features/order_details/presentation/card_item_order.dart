import 'dart:math';

import 'package:e_commerce/features/order_details/domain/entites/order_details_entity/product_order_entity.dart';
import 'package:flutter/material.dart';

class CardItemOrder extends StatelessWidget {
  ProductOrderEntity product;
  String status;

  CardItemOrder({
    required this.product,
    required this.status,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 240,
          width: 300,
          child: Column(
            children: [
              Row(
                children: [
                  // Image Section
                  Container(
                    width: 150,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(50),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(2, 3),
                        ),
                      ],
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomRight: Radius.circular(46),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(-1, -1),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomRight: Radius.circular(46),
                        ),
                        child: Container(
                          color: Colors.grey[300], // صورة افتراضية مكان الصورة الحقيقية
                          child: Center(
                            child: Image.network("${product.mainImage}"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Text Section
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // First Row: Product Name
                          Text(
                            "${product.productName}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Second Row: Store Name and Material
                          Text(
                            '${product.storeName} ',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${product.categoryName}' ,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          // Third Row: Price, Quantity, and Total
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${product.price}     *     (${product.quantity})',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                          const SizedBox(height: 16),

                    Text(
                      '${product.description}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${status}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                      ),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

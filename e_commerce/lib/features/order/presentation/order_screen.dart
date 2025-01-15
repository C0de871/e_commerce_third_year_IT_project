import 'package:e_commerce/features/order/domain/entites/order_entity.dart';
import 'package:e_commerce/features/order/presentation/check_cubit/get_order_cubit.dart';
import 'package:e_commerce/features/order/presentation/check_cubit/get_order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('My Orders'),
            ),
            body: BlocConsumer<GetOrderCubit, GetOrderState>(
                listener: (context, state) {
              // TODO: implement listener
            }, builder: (context, state) {
              if (state is GetOrderSuccess) {
                final OrderEntity orders = state.orders;
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ProductGrid(orders:orders),
                );
              } else {
                return Center(
                  child: Text("errorrr"),
                );
              }
            })));
  }
}

class ProductGrid extends StatelessWidget {
  final OrderEntity orders;

  const ProductGrid({super.key, required this.orders});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemCount: orders.orders!.length,
      itemBuilder: (context, index) {
        return ProductCard(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetails(
                  productName: 'Product $index',
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final VoidCallback onTap;

  ProductCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Placeholder(
                  fallbackHeight: 80,
                  fallbackWidth: 80,
                ),
                const SizedBox(height: 10),
                Text(
                  'x products',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Text(
                  '12-12-2024',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'status',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Center(
            child: IconButton(
              onPressed: () {
                // إضافة الوظيفة التي تريدها عند الضغط على الأيقونة
              },
              icon: const Icon(Icons.remove_circle_sharp),
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }
}

class ProductDetails extends StatelessWidget {
  final String productName;

  ProductDetails({required this.productName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text(
          'Details of $productName',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

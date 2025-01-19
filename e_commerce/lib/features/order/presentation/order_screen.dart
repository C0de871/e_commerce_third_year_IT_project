import 'dart:developer';
import 'package:e_commerce/core/Routes/app_routes.dart';
import 'package:e_commerce/features/order/domain/entites/order_entity.dart';
import 'package:e_commerce/features/order/domain/entites/sub_order_entity.dart';
import 'package:e_commerce/features/order/presentation/order_cubit/delete_order_cubit.dart';
import 'package:e_commerce/features/order/presentation/order_cubit/get_order_cubit.dart';
import 'package:e_commerce/features/order/presentation/order_cubit/get_order_state.dart';
import 'package:e_commerce/features/order_details/presentation/order_details_cubit/get_order_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: const Text('My Orders'),
            ),
            body: BlocConsumer<GetOrderCubit, GetOrderState>(
                listener: (context, state) {
              // TODO: implement listener
            }, builder: (context, state) {
              if (state is GetOrderSuccess) {
                log("u in right ***");
                final OrderEntity orders = state.orders;
                print("Orders: ${orders.data}");
                int tot = orders.data?.length ?? 0;
                log("${tot}");
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ProductGrid(orders: orders),
                );
              } else {
                return Center(
                  child: Text("Go to shopping",style: TextStyle(
                    fontSize: 20
                  ),),
                );
              }
            }));
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
        childAspectRatio: 0.55,
      ),
      itemCount: orders.data!.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {

            debugPrint("Navigating to ${AppRoutes.orderDetailsRoute} with ID: ${orders.data![index].id}");
            Navigator.pushNamed(context, AppRoutes.orderDetailsRoute,arguments:orders.data![index]);
            
            
            
          },
          child: ProductCard(orders.data![index]),
        );
      },
    );
  }
}
class ProductCard extends StatelessWidget {
  final SubOrderEntity subOrderEntity;

  const ProductCard(this.subOrderEntity);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 200,
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
            
            ClipOval(
              child: Image.network(
                subOrderEntity.image ??
                    '', 
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "${subOrderEntity.numberOfProducts} products",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              "${subOrderEntity.orderDate}",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "${subOrderEntity.status}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),
            
            const Spacer(),
            IconButton(
              onPressed: () {
                context.read<DeleteOrderCubit>().deleteOrderTrigger(
                      orderID: (subOrderEntity.id).toString(),
                    );
              },
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

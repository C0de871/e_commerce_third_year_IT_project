import 'package:e_commerce/features/home/presentation/Home%20Screen/widgets/product_card.dart';
import 'package:e_commerce/features/order_details/domain/entites/order_details_entity/product_order_entity.dart';
import 'package:e_commerce/features/order_details/presentation/card_item_order.dart';
import 'package:e_commerce/features/order_details/presentation/order_details_cubit/get_order_details_cubit.dart';
import 'package:e_commerce/features/order_details/presentation/order_details_cubit/get_order_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
        appBar: AppBar(
          title: const Text('Product Cards'),
        ),
        body: BlocConsumer<GetOrderDetailsCubit, GetOrderDetailsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if(state is GetOrderDetailsSuccess )
          { 
    return ListView.builder(
      itemCount: state.orderDetailsEntity.dataOrderEntity!.productsOrderEntity!.length,
      itemBuilder: (context, index) {
        final order=state.orderDetailsEntity.dataOrderEntity!.productsOrderEntity![index];
        final status=state.orderDetailsEntity.dataOrderEntity!.status;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: CardItemOrder(
            product: order,
            status:status as String
          ),
        );
      },
    );
  }else{
    return Center(child: Text("waiting...."),);
  }
}

 ),); }}
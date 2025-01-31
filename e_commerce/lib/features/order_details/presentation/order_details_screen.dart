import 'package:e_commerce/features/order_details/presentation/card_item_order.dart';
import 'package:e_commerce/features/order_details/presentation/order_details_cubit/get_order_details_cubit.dart';
import 'package:e_commerce/features/order_details/presentation/order_details_cubit/get_order_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Import localization

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.orderDetails), // Localized string
      ),
      body: BlocConsumer<GetOrderDetailsCubit, GetOrderDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetOrderDetailsSuccess) {
            return ListView.builder(
              itemCount: state.orderDetailsEntity.dataOrderEntity!.productsOrderEntity!.length,
              itemBuilder: (context, index) {
                final order = state.orderDetailsEntity.dataOrderEntity!.productsOrderEntity![index];
                final status = state.orderDetailsEntity.dataOrderEntity!.status;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: CardItemOrder(product: order, status: status as String),
                );
              },
            );
          } else {
            return Center(
              child: Text(AppLocalizations.of(context)!.waiting), // Localized string
            );
          }
        },
      ),
    );
  }
}

import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/shared/widgets/defualt_button.dart';

import 'package:e_commerce/core/utils/constants/app_numbers.dart';
import 'package:e_commerce/features/cart/presentation/cart_screen/Widgets/cart_item_card.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/cubit/delete_cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/cubit/modify_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:svg_flutter/svg.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is ClearSuccess) {
            print("*****************listner baby");
          }
        },
        builder: (context, state) {
          if (state is CartFailure) {
            return Center(child: Text(state.errMessage));
          } else if (state is ClearFailure) {
            return Center(child: Text(state.errMessage));
          } else if (state is ClearSuccess) {
            return Center(child: Text(state.messageEntity.message!));
          } else if (state is CartSuccess) {
            return Column(
              children: [
                // قائمة المنتجات
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding4 * 5),
                    child: ListView.builder(
                      itemCount: state.cart.data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        final cartItem = state.cart.data![index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Dismissible(
                            key: Key(cartItem.productId.toString()),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: padding4 * 5),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                borderRadius:
                                    BorderRadius.circular(padding4 * 3.5),
                              ),
                              child: Row(
                                children: [
                                  const Spacer(),
                                  SvgPicture.asset(AppImages.trachIcon),
                                ],
                              ),
                            ),
                            onDismissed: (direction) {
                              final deleteCubit =
                                  context.read<DeleteCartCubit>();
                              deleteCubit.addDeletedItem(
                                  cartItem.productId ?? 0,
                                  cartItem.storeId ?? 0);
                            },
                            child: CartItemCard(cartItem: cartItem),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // الأزرار الثلاثة في الأسفل
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DefaultButton(
                        text: AppLocalizations.of(context)!.confirmModification,
                        press: () {
                          context.read<ModifyCartCubit>().modifyTrigger();
                        },
                        width: 100,
                      ),
                      DefaultButton(
                        text: AppLocalizations.of(context)!.checkOut,
                        press: () {
                          // Navigator.pushNamed(
                          //   context,
                          //   AppRoutes.checkOutScreen,
                          //   arguments: state.cart.data,
                          // );
                        },
                        width: 100,
                      ),
                      DefaultButton(
                        text: AppLocalizations.of(context)!.confirmDeletion,
                        press: () {
                          context.read<DeleteCartCubit>().deleteCartTrigger();
                        },
                        width: 100,
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    title: Column(
      children: [
        Text(
          AppLocalizations.of(context)!.yourCart,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    ),
    centerTitle: true,
    actions: [
      IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          context.read<CartCubit>().clearCartTrigger();
        },
      ),
    ],
  );
}

import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/shared/widgets/defualt_button.dart';

import 'package:e_commerce/core/utils/constants/app_numbers.dart';
import 'package:e_commerce/features/cart/data/models/cart_model.dart';
import 'package:e_commerce/features/cart/domain/entites/cart_entity.dart';
import 'package:e_commerce/features/cart/presentation/cart_screen/Widgets/cart_item_card.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/cubit/modify_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:svg_flutter/svg.dart';
import 'package:e_commerce/core/translations/l10n.dart';
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
            listener: (context, state) {},
            builder: (context, state) {
              if (state is CartFailure) {
                return Center(child: Text(state.errMessage));
              } else if (state is CartSuccess) {
                return Stack(
                  children: [
                    Padding(
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
                                onDismissed: (direction) {},
                                child: CartItemCard(
                                  cartItem: cartItem,
                                ),
                              ),
                            );
                          }),
                    ),
                    Row(
                      children: [
                        DefaultButton(
                            text: AppLocalizations.of(context)!.confirmPassword,
                            //ToDo modify the name
                            press: () {
                              final modifiedItempsMap=context.read<CartCubit>().getModifiedItemsMap();
                              context.read<ModifyCartCubit>().modifyTrigger(modifiedItempsMap);
                            }),
                        DefaultButton(
                            text: AppLocalizations.of(context)!.confirmPassword,
                            //ToDo modify the name
                            press: () {}),
                        DefaultButton(
                            text: AppLocalizations.of(context)!.confirmPassword,
                            //ToDo modify the name
                            press: () {}),
                      ],
                    )
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    title: Column(children: [
      Text(
        AppLocalizations.of(context)!.yourCart,
        style: Theme.of(context).textTheme.displaySmall,
      ),
    ]),
    centerTitle: true,
  );
}

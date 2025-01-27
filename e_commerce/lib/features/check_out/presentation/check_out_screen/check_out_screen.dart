import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/shared/widgets/defualt_button.dart';
import 'package:e_commerce/features/auth/domain/entites/user_entities/user_entities.dart';
import 'package:e_commerce/features/auth/presentation/cubit/get_last_user_cubit/get_last_user_cubit.dart';
import 'package:e_commerce/features/cart/domain/entites/cart_entity/sub_cart_entity.dart';
import 'package:e_commerce/features/check_out/presentation/check_cubit/check_out_cubit.dart';
import 'package:e_commerce/features/check_out/presentation/check_cubit/check_out_state.dart';
import 'package:e_commerce/features/check_out/presentation/check_out_screen/one_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final checkoutData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final List<SubCartEntity> cartItems = (checkoutData[ApiKey.data] as List)
        .map((item) => SubCartEntity.fromJson(item as Map<String, dynamic>))
        .toList();
    final double totalPrice = checkoutData[ApiKey.totalPrice]!;
    const double shippingFees = 500.0;
    final double finalPrice = totalPrice + shippingFees;
    UserEntity? user;
    if (context.read<GetLastUserCubit>().state is UserLoaded) {
      user = (context.read<GetLastUserCubit>().state as UserLoaded).user;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.checkOut),
      ),
      body: Column(
        children: [
          // العناصر القابلة للتمرير
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).colorScheme.surfaceContainerLowest,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          offset: const Offset(0, 4),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    width: double.infinity,
                    height: 225,
                    padding: const EdgeInsets.all(10),
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        final SubCartEntity cartItem = cartItems[index];
                        return OneProduct(cartItem: cartItem);
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).colorScheme.surfaceContainerLowest,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          offset: const Offset(0, 4),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 250,
                          height: 55,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFFC1DEEC),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                size: 30,
                                color: Color(0xFF1B6DE7),
                              ),
                              Text(
                                "${AppLocalizations.of(context)!.delivery}",
                                style: TextStyle(
                                  color: Color(0xFF1B6DE7),
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: AppLocalizations.of(context)!.name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "${user?.subUserEntity?.firstName ?? 'Unknown'} ${user?.subUserEntity?.lastName ?? 'Unknown'} ",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: AppLocalizations.of(context)!.location,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "${user?.subUserEntity?.location ?? 'Unknown'}",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .surfaceContainerLowest,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                offset: const Offset(0, 4),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 250,
                                height: 55,
                                padding: const EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFC8E6C9),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      size: 30,
                                      color: Color(0xFF2E7D32),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "${AppLocalizations.of(context)!.contact}",
                                      style: TextStyle(
                                        color: Color(0xFF2E7D32),
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: AppLocalizations.of(context)!
                                          .phoneNumber,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          ":${user?.subUserEntity?.phoneNumber ?? 'Unknown'}",
                                      style: TextStyle(
                                        color: Color(0xFF2E7D32),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: AppLocalizations.of(context)!.email,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          ":${user?.subUserEntity?.email ?? 'Unknown'}",
                                      style: TextStyle(
                                        color: Color(0xFF2E7D32),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .surfaceContainerLowest,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                offset: const Offset(0, 4),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 250,
                                height: 55,
                                padding: const EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEFEBE9),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_pin,
                                      size: 30,
                                      color: Color(0xFF6D4C41),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "${AppLocalizations.of(context)!.totalCost}",
                                      style: TextStyle(
                                        color: Color(0xFF6D4C41),
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: AppLocalizations.of(context)!
                                          .productsPrice,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "----------${totalPrice}",
                                      style: TextStyle(
                                        color: Color(0xFF6D4C41),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: AppLocalizations.of(context)!
                                          .shippingfees,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "-----------500",
                                      style: TextStyle(
                                        color: Color(0xFF6D4C41),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: AppLocalizations.of(context)!.total,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "--------------------${finalPrice}",
                                      style: TextStyle(
                                        color: Color(0xFF6D4C41),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // الزر الثابت في الأسفل
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocConsumer<CheckOutCubit, CheckOutState>(
             listener: (context, state) {
                if (state is CheckOutSuccess) {
                  if(state.checkOutOrderEntity.message=="Orders created successfully.")
                  // عرض SnackBar عند نجاح الأوردر
                  {ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(" Order Done ..."),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 3),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Order Failed"),
                        content: Text("Please review your cart screen."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // إغلاق مربع الحوار
                            },
                            child: Text("Confirm"),
                          ),
                        ],
                      );
                    },
                  );
                } 
                }else{
                  return;
                }
              }, 
              builder: (context, state) {
                return DefaultButton(
                  text: AppLocalizations.of(context)!.order,
                  press: () {
                    context
                        .read<CheckOutCubit>()
                        .createOrderTrigger(cartItems: cartItems);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

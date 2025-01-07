import 'dart:developer';

import 'package:e_commerce/core/Routes/app_router.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/databases/cache/storage_helper.dart';
import 'package:e_commerce/features/cart/presentation/cubit/size_cart_cubit.dart';
import 'package:e_commerce/features/home/presentation/Home%20Screen/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/databases/cache/secure_storage_helper.dart';
import '../../../../core/utils/constants/app_numbers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'widgets/discount_banner.dart';
import 'widgets/popular_product_list.dart';
import 'widgets/popular_stores.dart';
import 'widgets/section_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void logREfreshtoken() async {
    final String refresh =
        (await SecureStorageHelper().getData(key: CacheKey.refreshToken))!;
    log("refresh token is: {$refresh}");
  }

  @override
  void initState() {

    context.read<SizeCartCubit>().getSizeCartTrigger();
    logREfreshtoken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const HomeAppBar(),
        SliverToBoxAdapter(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: padding4 * 3),
                const DiscountBanner(),
                const SizedBox(height: padding4 * 7),
                SectionTitle(
                    text: AppLocalizations.of(context)!.specialForYou,
                    press: () {}),
                const SizedBox(height: padding4 * 5),
                const PopularStores(),
                const SizedBox(height: padding4 * 7),
                SectionTitle(
                    text: AppLocalizations.of(context)!.popularProduct,
                    press: () {}),
                const SizedBox(height: padding4 * 5),
                const PopularProductList(),
                const SizedBox(height: 100),
              ],
            ),
          ),
        )
      ],
    );
  }
}

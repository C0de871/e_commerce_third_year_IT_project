import 'package:e_commerce/core/constants/app_numbers.dart';
import 'package:e_commerce/core/functions/app_functions.dart';
import 'package:e_commerce/features/home/presentation/Home%20Screen/widgets/popular_product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'widgets/discount_banner.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/product_card.dart';
import 'widgets/section_title.dart';
import 'widgets/popular_stores.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //todo: remove every fetchingproduct state:
    FetchProductState fetchingProductState = FetchProductState.SUCCESS;
    final currentBrightness = Theme.of(context).brightness;
    final systemUiOverlayStyle = getSystemUiOverlayStyle(currentBrightness, context);
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: systemUiOverlayStyle,
        child: SafeArea(
          child: CustomScrollView(
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
                      SectionTitle(text: AppLocalizations.of(context)!.specialForYou, press: () {}),
                      const SizedBox(height: padding4 * 5),
                      const PopularStores(),
                      const SizedBox(height: padding4 * 7),
                      SectionTitle(
                        text: AppLocalizations.of(context)!.popularProduct,
                        press: () {},
                      ),
                      const SizedBox(height: padding4 * 5),
                      PopularProductList(fetchingProductState: fetchingProductState),
                      // const SizedBox(height: 30),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

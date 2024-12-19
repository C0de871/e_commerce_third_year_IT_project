import 'package:e_commerce/core/constants/app_numbers.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/icon_btn_with_counter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      forceElevated: true,
      shadowColor: Theme.of(context).colorScheme.primary,
      // elevation: ,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      primary: false,
      pinned: true,
      surfaceTintColor: Theme.of(context).colorScheme.inversePrimary,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      expandedHeight: 100,
      collapsedHeight: 80,
      flexibleSpace: const FlexibleSpaceBar(
        expandedTitleScale: 1,
        centerTitle: true,
        titlePadding: EdgeInsets.only(
          right: padding4 * 4,
          left: padding4 * 4,
          bottom: padding4 * 4,
          top: padding4 * 4,
        ),
        title: FlexibleSpaceTitle(),
      ),
    );
  }
}

class FlexibleSpaceTitle extends StatelessWidget {
  const FlexibleSpaceTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [MenuIconAndAppName(), CartAndNotificationIcons()],
        ),
      ],
    );
  }
}

class CartAndNotificationIcons extends StatelessWidget {
  const CartAndNotificationIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconBtnWithCounter(
          svgSrc: 'assets/icons/bxs-bell.svg',
          //todo: make it depend on the list that come from the back
          numOfItems: 100,
          press: () {},
        ),
        const SizedBox(
          width: padding4 * 4,
        ),
        IconBtnWithCounter(
          svgSrc: 'assets/icons/bxs-cart.svg',
          //todo: make it depend on the list that come from the back
          numOfItems: 9,
          press: () {},
        ),
      ],
    );
  }
}

class MenuIconAndAppName extends StatelessWidget {
  const MenuIconAndAppName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.menu,
          color: Theme.of(context).colorScheme.onInverseSurface,
          size: 32,
        ),
        const SizedBox(width: 16),
        const HomeAppName(),
      ],
    );
  }
}

class HomeAppName extends StatelessWidget {
  const HomeAppName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          color: Theme.of(context).colorScheme.onInverseSurface,
        ),
        children: [
          TextSpan(
            // text: 'Hommies\n',
            text: "${AppLocalizations.of(context)!.appName}\n",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: AppLocalizations.of(context)!.expressShopping,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
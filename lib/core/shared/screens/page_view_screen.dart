import 'package:e_commerce/core/helper/app_functions.dart';
import 'package:e_commerce/features/favorites/presentation/cubit/getFavList/get_fav_list_cubit.dart';
import 'package:e_commerce/features/favorites/presentation/cubit/toggle_fav_cubit.dart';
import 'package:e_commerce/features/favorites/presentation/screens/fav_list_screen.dart';
import 'package:e_commerce/features/get_product_details/presentation/cubit/get_product_details_cubit.dart';
import 'package:e_commerce/features/home/beta/notification_page.dart';
import 'package:e_commerce/features/home/presentation/HomeCubit/home_cubit.dart';
import 'package:e_commerce/core/shared/screens/Navigation_cubit/navigation_bar_cubit.dart';
import 'package:e_commerce/features/settings/presentation/settings_screen.dart';
import 'package:e_commerce/features/user/presentation/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/bottom_nav_bar.dart';
import '../../../features/home/presentation/Home Screen/home_screen.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  List<Widget> screens = [
    HistoryPage(),
    SettingsScreen(),
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetProductDetailsCubit.instance,
        ),
        BlocProvider(
          create: (context) => ToggleFavCubit.instance,
        ),
      ],
      child: const HomeScreen(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetProductDetailsCubit.instance),
        BlocProvider(create: (context) => ToggleFavCubit.instance),
        BlocProvider(create: (context) => GetFavListCubit.instance..getFavList()),
      ],
      child: FavListScreen(),
    ),
    ProfileScreen(),
  ];

  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).getHomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentBrightness = Theme.of(context).brightness;
    final systemUiOverlayStyle = getSystemUiOverlayStyle(
      currentBrightness,
      context,
    );
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemUiOverlayStyle,
      child: SafeArea(
        child: Scaffold(
          extendBody: true,
          bottomNavigationBar: CustomNavigationBar(),
          body: BlocBuilder<NavigationBarCubit, int>(
            builder: (context, state) {
              return screens[state];
            },
          ),
        ),
      ),
    );
  }
}

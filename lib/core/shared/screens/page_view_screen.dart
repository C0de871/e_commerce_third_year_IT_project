import 'package:e_commerce/core/helper/app_functions.dart';
import 'package:e_commerce/features/home/beta/fav_page.dart';
import 'package:e_commerce/features/home/beta/notification_page.dart';
import 'package:e_commerce/features/home/beta/profile_page.dart';
import 'package:e_commerce/features/home/beta/settings_page.dart';
import 'package:e_commerce/features/home/presentation/HomeCubit/home_cubit.dart';
import 'package:e_commerce/features/home/presentation/Navigation%20cubit/navigation_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/bottom_nav_bar.dart';
import '../../../features/home/presentation/Home Screen/home_screen.dart';

class PageViewScreen extends StatefulWidget {
  static String routeName = '/home';
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  List<Widget> screens = [
    HistoryPage(),
    SettingsPage(),
    HomeScreen(),
    FavPage(),
    ProfilePage(),
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

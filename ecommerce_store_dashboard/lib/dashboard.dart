import 'package:ecommerce_store_dashboard/core/shared/widgets/my_place_holder.dart';
import 'package:ecommerce_store_dashboard/features/products/presentation/screens/show_product_screen/show_product_screen.dart';
import 'package:flutter/material.dart';

import 'features/products/presentation/screens/add_product_screen/add_product_screen.dart';
import 'side_menu.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;

  Widget _getCurrentView() {
    switch (_selectedIndex) {
      case 0:
        return const StoreDetailsView();
      case 1:
        return const AddProductScreen();
      default:
        return const MyPlaceHolder();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideMenu(
        selectedIndex: _selectedIndex,
        onNavItemTapped: _onNavItemTapped,
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SideMenu(
                selectedIndex: _selectedIndex,
                onNavItemTapped: _onNavItemTapped,
              ),
            ),
            Expanded(
              flex: 5,
              child: _getCurrentView(),
            ),
          ],
        ),
      ),
    );
  }
}

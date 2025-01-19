import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dashboard_screen.dart';
import 'side_menu.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const SideMenu(),
      body: const SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Expanded(
                //default flex = 1
                //it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              //It takes 5/6 part of the screen
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}


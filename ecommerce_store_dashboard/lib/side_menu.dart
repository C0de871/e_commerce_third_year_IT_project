import 'package:flutter/material.dart';


class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
    required this.selectedIndex,
    required this.onNavItemTapped,
  });

  final int selectedIndex;
  final void Function(int) onNavItemTapped;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        child: SingleChildScrollView(
          //It enable Scrolling
          child: Column(children: [
            DrawerHeader(
              child: Image.asset("assets/app_icon/delivery-man.png"),
            ),
            DrawerListTile(
              title: 'Inventory',
              icon: Icons.storefront,
              press: () => onNavItemTapped(0),
              isSelected: selectedIndex == 0,
            ),
            DrawerListTile(
              title: 'Add Product',
              icon: Icons.add,
              press: () => onNavItemTapped(1),
              isSelected: selectedIndex == 1,
            ),
          ]),
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.press,
    required this.isSelected,
  });

  final String title;
  final IconData icon;
  final VoidCallback press;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 13,
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? Theme.of(context).colorScheme.inversePrimary : Theme.of(context).colorScheme.onSurface,
        ),
      ),
      leading: Icon(
        icon,
        color: isSelected ? Theme.of(context).colorScheme.inversePrimary : Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}

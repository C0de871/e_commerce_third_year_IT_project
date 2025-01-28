import 'package:flutter/material.dart';


class NavigationPanel extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const NavigationPanel({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.blue[50],
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Store Manager',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          NavigationItem(
            icon: Icons.storefront,
            label: 'Store Details',
            isSelected: selectedIndex == 0,
            onTap: () => onItemTapped(0),
          ),
          NavigationItem(
            icon: Icons.inventory,
            label: 'Inventory',
            isSelected: selectedIndex == 1,
            onTap: () => onItemTapped(1),
          ),
          NavigationItem(
            icon: Icons.analytics,
            label: 'Analytics',
            isSelected: selectedIndex == 2,
            onTap: () => onItemTapped(2),
          ),
        ],
      ),
    );
  }
}

class NavigationItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NavigationItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? Colors.blue : Colors.grey,
      ),
      title: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.blue : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: onTap,
      selected: isSelected,
    );
  }
}

// Enhanced models with more comprehensive details
class StoreDetails {
  final String name;
  final String description;
  final String imageUrl;
  final String address;
  final String contactEmail;
  final String contactPhone;

  StoreDetails({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.address,
    required this.contactEmail,
    required this.contactPhone,
  });
}

class Product {
  final String id;
  final String name;
  final int quantity;
  final String imageUrl;
  final double price;
  final double costPrice;
  final String description;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.quantity,
    required this.imageUrl,
    required this.price,
    required this.costPrice,
    required this.description,
    required this.category,
  });
}

class ResponsiveLayout {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800 && MediaQuery.of(context).size.width < 1200;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200;
  }

  static int getGridColumnCount(BuildContext context) {
    if (isMobile(context)) return 2;
    if (isTablet(context)) return 3;
    return 4;
  }

  static double getCardAspectRatio(BuildContext context) {
    if (isMobile(context)) return 0.7;
    if (isTablet(context)) return 0.9;
    return 0.8;
  }
}


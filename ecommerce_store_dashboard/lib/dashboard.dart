import 'package:ecommerce_store_dashboard/core/shared/widgets/my_place_holder.dart';
import 'package:ecommerce_store_dashboard/features/order_dash/presentation/order_screen/order_screen.dart';
import 'package:ecommerce_store_dashboard/features/products/presentation/screens/show_product_screen/show_product_screen.dart';
import 'package:flutter/material.dart';

import 'features/products/presentation/screens/add_product_screen/add_product_screen.dart';
import 'side_menu.dart';
import 'storing.dart';

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
  final StoreDetails _storeDetails = StoreDetails(
    name: 'Urban Trends Boutique',
    description: 'A premium fashion destination for modern professionals',
    imageUrl: 'https://example.com/store-image.jpg',
    address: '123 Fashion Street, Downtown',
    contactEmail: 'contact@urbantrendsboutique.com',
    contactPhone: '+1 (555) 123-4567',
  );

  final List<Product> _products = [
    Product(
      id: '001',
      name: 'Classic Tailored Blazer',
      quantity: 25,
      imageUrl: 'https://example.com/blazer.jpg',
      price: 129.99,
      description: 'Precision-tailored blazer in premium wool blend',
      category: 'Formal Wear',
      costPrice: 80.50,
    ),
    Product(
      id: '002',
      name: 'Silk Designer Scarf',
      quantity: 50,
      imageUrl: 'https://example.com/scarf.jpg',
      price: 45.50,
      description: 'Luxurious silk scarf with intricate geometric design',
      category: 'Accessories',
      costPrice: 22.75,
    ),
    Product(
      id: '001',
      name: 'Classic Tailored Blazer',
      quantity: 0,
      imageUrl: 'https://example.com/blazer.jpg',
      price: 129.99,
      description: 'Precision-tailored blazer in premium wool blend',
      category: 'Formal Wear',
      costPrice: 80.50,
    ),
    Product(
      id: '002',
      name: 'Silk Designer Scarf',
      quantity: 4,
      imageUrl: 'https://example.com/scarf.jpg',
      price: 45.50,
      description: 'Luxurious silk scarf with intricate geometric design',
      category: 'Accessories',
      costPrice: 22.75,
    ),
    Product(
      id: '001',
      name: 'Classic Tailored Blazer',
      quantity: 0,
      imageUrl: 'https://example.com/blazer.jpg',
      price: 129.99,
      description: 'Precision-tailored blazer in premium wool blend',
      category: 'Formal Wear',
      costPrice: 80.50,
    ),
    Product(
      id: '002',
      name: 'Silk Designer Scarf',
      quantity: 18,
      imageUrl: 'https://example.com/scarf.jpg',
      price: 45.50,
      description: 'Luxurious silk scarf with intricate geometric design',
      category: 'Accessories',
      costPrice: 22.75,
    ),
    // Add more products
  ];

  Widget _getCurrentView() {
    switch (_selectedIndex) {
      case 0:
        return StoreDetailsView(store: _storeDetails, products: _products);
      case 1:
        return const AddProductScreen();
      case 2:
        return const OrderScreen();
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

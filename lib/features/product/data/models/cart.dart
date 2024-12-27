import 'package:e_commerce/core/constants/app_images.dart';

class ProductData {
  final int numOfItems;
  final Product product;

  ProductData({required this.product, required this.numOfItems});
}

class Product {
  final int id;
  final String image;
  final int price;
  final String title;

  Product(
      {required this.title,
      required this.id,
      required this.image,
      required this.price});
}

List<ProductData> demoCarts = [
  ProductData(product: demoProduct[0], numOfItems: 2),
  ProductData(product: demoProduct[1], numOfItems: 2),
  ProductData(product: demoProduct[2], numOfItems: 3),
];
List<Product> demoProduct = [
  Product(id: 1, title: "aydii", image: AppImages.successImage, price: 2000),
  Product(id: 2, title: "ngp", image: AppImages.successImage, price: 3000),
  Product(id: 2, title: "ngp", image: AppImages.successImage, price: 3000),
];

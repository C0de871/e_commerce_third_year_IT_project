import 'products_entity.dart';

class ShowStoreEntity {
  final int id;
  final String manager;
  final String email;
  final String phoneNumber;
  final String name;
  final String imageUrl;
  final String location;
  final String description;
  final List<ProductEntity> products;

  ShowStoreEntity({
    required this.id,
    required this.manager,
    required this.email,
    required this.phoneNumber,
    required this.name,
    required this.imageUrl,
    required this.location,
    required this.description,
    required this.products,
  });
}

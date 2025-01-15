// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/features/get_store_details/domain/entities/show_store_entities/store_product_entity.dart';

class StoreDetailsDataEntity {
  int id;
  String manager;
  String name;
  String imageUrl;
  String location;
  String description;
  List<StoreProductEntity> products;
  StoreDetailsDataEntity({
    required this.id,
    required this.manager,
    required this.name,
    required this.imageUrl,
    required this.location,
    required this.description,
    required this.products,
  });
}

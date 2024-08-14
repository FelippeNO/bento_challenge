import 'package:bento_challenge/product/domain/entities/product_details_entity.dart';

class HomeProductsSessionEntity {
  final String name;
  final List<ProductDetailsEntity> productSnapshots;

  HomeProductsSessionEntity({
    required this.name,
    required this.productSnapshots,
  });

  factory HomeProductsSessionEntity.fromJson(Map<String, dynamic> json) {
    return HomeProductsSessionEntity(
      name: json['name'],
      productSnapshots: List<ProductDetailsEntity>.from(
        json['products'].map(
          (x) => ProductDetailsEntity.fromMap(x),
        ),
      ),
    );
  }
}

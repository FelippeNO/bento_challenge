import 'dart:ui';

import 'package:bento_challenge/product/domain/entities/product_category_entity.dart';

class ProductDetailsEntity {
  final int id;
  final String name;
  final String shop;
  final String price;
  final String rating;
  final List<String> imagesPath;
  final String? comparativePrice;
  final String details;
  final bool isFavorited;
  final List<ProductCategoryEntity> categories;
  final Color backgroundColor;

  ProductDetailsEntity({
    required this.id,
    required this.name,
    required this.shop,
    required this.price,
    required this.rating,
    required this.imagesPath,
    this.comparativePrice,
    required this.details,
    required this.isFavorited,
    required this.categories,
    required this.backgroundColor,
  });

  factory ProductDetailsEntity.fromMap(Map<String, dynamic> map) {
    return ProductDetailsEntity(
      id: map['id'],
      name: map['name'],
      shop: map['shop'],
      price: map['price'],
      rating: map['rating'],
      imagesPath: List<String>.from(map['images_path']),
      comparativePrice: map['comparative_price'],
      details: map['details'],
      isFavorited: map['is_favorited'],
      categories: List<ProductCategoryEntity>.from(
        map['categories'].map(
          (category) => ProductCategoryEntity.fromMap(category),
        ),
      ),
      backgroundColor: Color(
        int.parse(
              map['background_color'].substring(1, 7),
              radix: 16,
            ) +
            0xFF000000,
      ),
    );
  }
}

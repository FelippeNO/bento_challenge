import 'dart:ui';

class ProductCategoryEntity {
  final int id;
  final String name;
  final String iconPath;
  final Color backgroundColor;

  ProductCategoryEntity({
    required this.id,
    required this.name,
    required this.iconPath,
    required this.backgroundColor,
  });

  factory ProductCategoryEntity.fromMap(Map<String, dynamic> map) {
    return ProductCategoryEntity(
      id: map['id'],
      name: map['name'],
      iconPath: map['icon_path'],
      backgroundColor: Color(int.parse(map['background_color'].substring(1, 7), radix: 16) + 0xFF000000),
    );
  }
}

class FoodKindEntity {
  final int id;
  final String name;
  final String iconPath;

  const FoodKindEntity({
    required this.id,
    required this.name,
    required this.iconPath,
  });

  factory FoodKindEntity.fromJson(Map<String, dynamic> json) {
    return FoodKindEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      iconPath: json['icon_path'] as String,
    );
  }
}

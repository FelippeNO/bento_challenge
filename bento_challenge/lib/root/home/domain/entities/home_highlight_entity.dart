class HomeHighlightEntity {
  final String title;
  final String iconPath;

  HomeHighlightEntity({
    required this.title,
    required this.iconPath,
  });

  factory HomeHighlightEntity.fromJson(Map<String, dynamic> json) {
    return HomeHighlightEntity(
      title: json['title'],
      iconPath: json['iconPath'],
    );
  }
}

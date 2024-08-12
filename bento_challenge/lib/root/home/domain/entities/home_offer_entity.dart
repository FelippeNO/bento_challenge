import 'package:flutter/material.dart';

class HomeOfferEntity {
  final String? smallText;
  final String title;
  final String imagePath;
  final String? callToActionText;
  final ImageLayoutEnum imageLayout;
  final CallToActionStyleEnum? callToActionStyle;
  final Color backgroundColor;

  HomeOfferEntity({
    this.smallText,
    required this.title,
    required this.imagePath,
    this.callToActionText,
    required this.imageLayout,
    this.callToActionStyle,
    required this.backgroundColor,
  });

  factory HomeOfferEntity.fromJson(Map<String, dynamic> json) {
    return HomeOfferEntity(
      smallText: json['smallText'],
      title: json['title'],
      imagePath: json['imagePath'],
      callToActionText: json['callToActionText'],
      imageLayout: ImageLayoutEnum.values.firstWhere((e) => e.name.toString() == json['imageLayout']),
      callToActionStyle: CallToActionStyleEnum.values.firstWhere((e) => e.name.toString() == json['callToActionStyle']),
      backgroundColor: Color(
        int.parse(
              json['backgroundColor'].substring(1, 7),
              radix: 16,
            ) +
            0xFF000000,
      ),
    );
  }
}

enum ImageLayoutEnum { left, right, center }

enum CallToActionStyleEnum { primary, secondary, tertiary }

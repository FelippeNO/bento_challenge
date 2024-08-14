import 'package:bento_challenge/core/design/ui_colors.dart';
import 'package:flutter/material.dart';

enum FontFamilyEnum {
  nunito;

  String get assetName => switch (this) {
        FontFamilyEnum.nunito => 'Nunito',
      };
}

class UIText extends StatelessWidget {
  const UIText(
    this.text, {
    super.key,
    this.color = UIColors.blueZodiac,
    this.fontSize = 14,
    this.letterSpacing = -0.5,
    this.maxLines,
    this.fontWeight = FontWeight.normal,
    this.overflow,
    this.textAlign = TextAlign.left,
    this.fontFamily = FontFamilyEnum.nunito,
    this.height,
    this.textBaseline,
    this.decorationStyle,
    this.textDecoration,
  });

  final String text;
  final Color color;
  final double fontSize;
  final double letterSpacing;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontFamilyEnum fontFamily;
  final double? height;
  final TextBaseline? textBaseline;
  final TextDecorationStyle? decorationStyle;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        color: color,
        decorationStyle: decorationStyle,
        height: height,
        decoration: textDecoration,
        textBaseline: textBaseline,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily.assetName,
        letterSpacing: letterSpacing,
        decorationColor: color,
      ),
    );
  }
}

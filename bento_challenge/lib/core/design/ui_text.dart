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
    this.color = Colors.black,
    this.fontSize = 14,
    this.letterSpacing = 0.7,
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

  const UIText.title(
    this.text, {
    super.key,
    this.color = Colors.black,
    this.fontSize = 24,
    this.letterSpacing = 1,
    this.maxLines,
    this.fontWeight = FontWeight.w800,
    this.overflow,
    this.textAlign = TextAlign.left,
    this.fontFamily = FontFamilyEnum.nunito,
    this.height,
    this.textBaseline,
    this.decorationStyle,
    this.textDecoration,
  });

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
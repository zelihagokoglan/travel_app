import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String textContent;
  final FontWeight textFontWeight;
  final Color textColor;
  final FontStyle textFontStyle;
  final double textFontSize;

  const CustomText(
      {super.key,
      required this.textContent,
      required this.textFontWeight,
      required this.textColor,
      this.textFontStyle = FontStyle.normal,
      required this.textFontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      textContent,
      style: TextStyle(
        color: textColor,
        fontStyle: textFontStyle,
        fontWeight: textFontWeight,
        fontSize: textFontSize,
      ),
    );
  }
}

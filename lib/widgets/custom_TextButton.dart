import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color textColor;
  final FontWeight textFontWeight;
  final FontStyle textFontStyle;
  final Size buttonMinimumSize;
  final Color textButtonColor;
  const CustomTextButton(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      required this.textColor,
      required this.textFontWeight,
      this.textFontStyle = FontStyle.normal,
      required this.textButtonColor,
      required this.buttonMinimumSize});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          primary: textButtonColor, minimumSize: buttonMinimumSize),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
            color: textColor,
            fontStyle: textFontStyle,
            fontWeight: textFontWeight),
      ),
    );
  }
}

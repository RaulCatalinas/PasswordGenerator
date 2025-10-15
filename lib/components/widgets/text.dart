import 'package:flutter/material.dart'
    show
        BuildContext,
        Color,
        StatelessWidget,
        Text,
        TextAlign,
        TextStyle,
        Widget;

class CreateText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;

  const CreateText({super.key, required this.text, this.fontSize, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, color: color),
      textAlign: TextAlign.center,
    );
  }
}

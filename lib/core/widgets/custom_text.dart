import 'package:flutter/material.dart';
import 'package:pill_reminder/core/helper/extensions.dart';

class CustomText extends StatelessWidget {
  final TextStyle style;
  final Color? color;
  final String text;
  final TextAlign textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;
  const CustomText(
      {super.key,
      required this.text,
      this.color,
      required this.style,
      this.textOverflow,
      this.maxLines,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      textAlign: textAlign,
      maxLines:maxLines ,
      style: TextStyle(
        color: context.isDarkMode ? Colors.white : Colors.black,
        overflow: textOverflow,
        
      ),
      child: Text(
        text,
        style: style.copyWith(
          color: color,
        ),
      ),
    );
  }
}

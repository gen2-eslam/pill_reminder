import 'package:flutter/material.dart';
import 'package:pill_reminder/core/helper/enums.dart';

abstract class ColorsManager {
  // static const Color bluishClr = Color(0xFF375FFF);
  static const Color yellowClr = Color(0xFFFFB746);
  // static const Color pinkClr = Color(0xFFff4667);
  static const Color redClr = Color(0xFFFE4A49);
  // static const Color white = Color(0xffFFFFFF);
  // // static const Color black = Color.fromARGB(255, 4, 8, 8);
  // static const Color darkBlue = Color(0xFF0F1828);
  // static const Color darkGreyClr = Color(0xFF121212);
  static const Color offWhite = Color(0xFFf5f5f5);
  static const Color white = Color(0xffFFFFFF);
  static const Color green = Color(0xff1BD15D);
  static const Color gray = Color(0xff9B9B9B);//9B9B9B
  static const Color lightGray = Color(0xffF8F8F6);
  static const Color darkblue = Color(0xff140151);
  static Color blackWithOpacity = const Color(0xff000000).withOpacity(0.7);
  static const Color black = Color(0xff0A0909);

  static Color colorState(ColorState colorState) {
    switch (colorState) {
      case ColorState.sucess:
        return green;
      case ColorState.failure:
        return redClr;
      case ColorState.warning:
        return yellowClr;
    }
  }
}

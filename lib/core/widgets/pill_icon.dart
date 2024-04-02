import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/core/utils/images_manager.dart';

class PillIcon extends StatelessWidget {
  const PillIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImagesManager.pill,
    );
  }
}

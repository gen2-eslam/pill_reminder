import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';

class CustomError extends StatelessWidget {
  final String errorMessage;
  const CustomError({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 50.0,
          ),
          SizedBox(height: 10.0.h),
          CustomText(
            text: errorMessage,
            textOverflow: TextOverflow.ellipsis,
            maxLines: 10,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0.h),
        ],
      ),
    );
  }
}

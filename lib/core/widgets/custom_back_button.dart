import 'package:flutter/material.dart';
import 'package:pill_reminder/core/helper/extensions.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
        ),
        onPressed: () {
          context.pop();
        });
  }
}

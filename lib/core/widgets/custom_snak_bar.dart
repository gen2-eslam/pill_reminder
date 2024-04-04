import 'package:flutter/material.dart';
import 'package:pill_reminder/core/helper/enums.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';

SnackBar customSnackBar(
    {required String text,
    required ColorState colorState,
    SnackBarBehavior behavior = SnackBarBehavior.floating}) {
  return SnackBar(
    duration: const Duration(
      seconds: 2,
    ),
    content: CustomText(
      text: text,
      style: TextStyleManager.textStyle15w500,
    ),
    backgroundColor: ColorsManager.colorState(colorState),
    behavior: behavior,
  );
}

// showDialog(
//                     barrierDismissible: false,
//                     context: context,
//                     builder: (BuildContext context) {
//                       return SimpleDialog(
//                         contentPadding: EdgeInsets.all(AppPadding.p10),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(AppPadding.p16),
//                         ),
//                         children: [
//                           Image.asset(
//                             ImagesManager.confirmEmail,
//                             scale: 1 / 1,
//                             fit: BoxFit.contain,
//                             height: context.deviceWidth * 0.30,
//                             // width: context.deviceWidth * 0.30,
//                           ),
//                           GapManager.gap12,
//                           CustomText(
//                               text: StringManager.confirmEmail,
//                               style: TextStyleManager.textStyle15w700),
//                           GapManager.gap12,
//                           CustomElevatedButton(
//                               child: CustomText(
//                                 text: StringManager.goBack,
//                                 style: TextStyleManager.textStyle12w400,
//                                 color: ColorsManager.white,
//                               ),
//                               onPressed: () {
//                                 context.pop();
//                                 context.pop();
//                               }),
//                         ],
//                       );
//                     },
//                     // show the dialog
//                   );

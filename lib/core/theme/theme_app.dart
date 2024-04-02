import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';

abstract class ThemeApp {
  static ThemeData light(BuildContext context) => ThemeData(
        primaryColor: ColorsManager.green,
        scaffoldBackgroundColor: ColorsManager.white,
        brightness: Brightness.light,
        useMaterial3: false,
        // fontFamily: GoogleFonts.aBeeZee().fontFamily,

        // app bar theme
        appBarTheme: AppBarTheme(
            centerTitle: true,
            elevation: 0,
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorsManager.offWhite,
              letterSpacing: 2,
              fontSize: 16.sp,
              fontStyle: FontStyle.italic,
            ),
            // shape: const RoundedRectangleBorder(
            //     borderRadius: BorderRadius.only(
            //   bottomLeft: Radius.circular(15),
            //   bottomRight: Radius.circular(15),
            // ),),
            backgroundColor: ColorsManager.green),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
          overlayColor: MaterialStateColor.resolveWith(
              (states) => ColorsManager.green.withOpacity(0.3)),
          foregroundColor:
              MaterialStateColor.resolveWith((states) => ColorsManager.green),
        )),

        // bottom nav bar theme
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: ColorsManager.offWhite,
          selectedItemColor: ColorsManager.green,
          showUnselectedLabels: false,
          unselectedItemColor:
              const Color.fromARGB(255, 11, 12, 14).withOpacity(0.7),
          type: BottomNavigationBarType.fixed,
        ),
        indicatorColor: ColorsManager.green,
        iconTheme: const IconThemeData(color: ColorsManager.black),
      );
  //dark theme
  // static ThemeData dark(BuildContext context) => ThemeData(
  //       scaffoldBackgroundColor: ColorsManager.darkBlue,
  //       primaryColor: ColorsManager.bluishClr,
  //       brightness: Brightness.dark,
  //       useMaterial3: false,

  //       // app bar theme
  //       appBarTheme: AppBarTheme(
  //           centerTitle: true,
  //           elevation: 0,
  //           titleTextStyle: TextStyle(
  //             fontWeight: FontWeight.bold,
  //             letterSpacing: 2,
  //             color: ColorsManager.white,
  //             fontSize: 16.sp,
  //             fontStyle: FontStyle.italic,
  //           ),
  //           // shape: const RoundedRectangleBorder(
  //           //   borderRadius: BorderRadius.only(
  //           //     bottomLeft: Radius.circular(15),
  //           //     bottomRight: Radius.circular(15),
  //           //   ),
  //           // ),
  //           backgroundColor: ColorsManager.bluishClr),

  //       // bottom nav bar theme
  //       bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //         elevation: 0,
  //         backgroundColor: ColorsManager.bluishClr,
  //         selectedItemColor: ColorsManager.white,
  //         showUnselectedLabels: false,
  //         unselectedItemColor: ColorsManager.white.withOpacity(0.7),
  //         type: BottomNavigationBarType.fixed,
  //       ),
  //       indicatorColor: ColorsManager.bluishClr,

  //       textButtonTheme: TextButtonThemeData(
  //           style: ButtonStyle(
  //         overlayColor: MaterialStateColor.resolveWith(
  //             (states) => ColorsManager.white.withOpacity(0.3)),
  //         foregroundColor:
  //             MaterialStateColor.resolveWith((states) => ColorsManager.white),
  //       )),

  //       inputDecorationTheme: InputDecorationTheme(
  //           border: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(20.r),
  //               borderSide: const BorderSide(color: ColorsManager.bluishClr)),
  //           prefixIconColor: ColorsManager.white,
  //           suffixIconColor: ColorsManager.white),
  //       iconTheme: const IconThemeData(color: ColorsManager.white),
  //     );
}

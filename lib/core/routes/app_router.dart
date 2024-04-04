import 'package:flutter/material.dart';
import 'package:pill_reminder/core/routes/routes.dart';
import 'package:pill_reminder/model/medicines/medicines_model.dart';
import 'package:pill_reminder/module/add_mdecine/add_medecine_screen.dart';
import 'package:pill_reminder/module/edit_bill/edit_pill_screen.dart';
import 'package:pill_reminder/module/forget_password/forget_password_screen.dart';
import 'package:pill_reminder/module/history/details_history_screen.dart';
import 'package:pill_reminder/module/history/history_screen.dart';
import 'package:pill_reminder/module/home/home_screen.dart';
import 'package:pill_reminder/module/login/login_screen.dart';
import 'package:pill_reminder/module/medecine/medecine_screen.dart';
import 'package:pill_reminder/module/notification/notification_screen.dart';
import 'package:pill_reminder/module/otp/otp_screen.dart';
import 'package:pill_reminder/module/profile/profile_screen.dart';
import 'package:pill_reminder/module/reset_password/reset_password_screen.dart';
import 'package:pill_reminder/module/reset_password/sucess_reset_password_screen.dart';
import 'package:pill_reminder/module/signup/signup_screen.dart';

abstract class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      // case Routes.onBoardingScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const OnBoardingScreen(),
      //   );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
      case Routes.forgetScreen:
        return MaterialPageRoute(
          builder: (_) => const ForgetPasswordScreen(),
        );
      case Routes.otpScreen:
        return MaterialPageRoute(
          builder: (_) => const OtpScreen(),
        );
      //ResetPasswordScreen
      case Routes.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordScreen(),
        );
      case Routes.successResetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const SucessResetPasswordScreen(),
        );
      //addMedecineScreen
      case Routes.addMedecineScreen:
        return MaterialPageRoute(
          builder: (_) => const AddMedecineScreen(),
        );
      case Routes.medecineScreen:
        return MaterialPageRoute(
          builder: (_) => MedecineScreen(medicines: arguments as Medicines),
        );
      case Routes.historyScreen:
        return MaterialPageRoute(
          builder: (_) => const HistoryScreen(),
        );
      case Routes.detailsHistoryScreen:
        return MaterialPageRoute(
          builder: (_) => const DetailsHistoryScreen(),
        );
      case Routes.editPillScreen:
        return MaterialPageRoute(
          builder: (_) => const EditPillScreen(),
        );
      //notificationScreen
      case Routes.notificationScreen:
        return MaterialPageRoute(
          builder: (_) => const NotificationScreen(),
        );
      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

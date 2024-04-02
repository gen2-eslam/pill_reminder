import 'package:flutter/material.dart';
import 'package:pill_reminder/core/routes/routes.dart';
import 'package:pill_reminder/module/add_mdecine/add_medecine_screen.dart';
import 'package:pill_reminder/module/forget_password/forget_password_screen.dart';
import 'package:pill_reminder/module/home/home_screen.dart';
import 'package:pill_reminder/module/login/login_screen.dart';
import 'package:pill_reminder/module/otp/otp_screen.dart';
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
          builder: (_) => const OtpScreen(text: "romancawy12@gmail.com"),
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
      // case Routes.signUpScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getIt<SignupCubit>(),
      //       child: const SignupScreen(),
      //     ),
      //   );

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

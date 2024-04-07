import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pill_reminder/controller/add_medicien/add_medicien_cubit.dart';
import 'package:pill_reminder/controller/forget_password/forget_password_cubit.dart';
import 'package:pill_reminder/controller/home/home_cubit.dart';
import 'package:pill_reminder/controller/login/login_cubit.dart';
import 'package:pill_reminder/controller/medicines/medicines_cubit.dart';
import 'package:pill_reminder/controller/otp_password/otp_password_cubit.dart';
import 'package:pill_reminder/controller/register/register_cubit.dart';
import 'package:pill_reminder/controller/reset_password/reset_password_cubit.dart';
import 'package:pill_reminder/core/routes/routes.dart';
import 'package:pill_reminder/model/medicines/medicines_model.dart';
import 'package:pill_reminder/model/medicines/repo/medicines_repo.dart';
import 'package:pill_reminder/model/register/register_repo/register_repo.dart';
import 'package:pill_reminder/module/add_mdecine/add_medecine_screen.dart';
import 'package:pill_reminder/module/edit_bill/edit_pill_screen.dart';
import 'package:pill_reminder/module/forget_password/forget_password_screen.dart';
import 'package:pill_reminder/module/history/details_history_screen.dart';
import 'package:pill_reminder/module/history/history_screen.dart';
import 'package:pill_reminder/module/home/home_screen.dart';
import 'package:pill_reminder/module/location/data/location_repo.dart';
import 'package:pill_reminder/module/location/logic/cubit/location_cubit.dart';
import 'package:pill_reminder/module/location/logic/services/location_service.dart';
import 'package:pill_reminder/module/location/logic/services/map_controller.dart';
import 'package:pill_reminder/module/location/view/location_view.dart';
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
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(loginRepo: AuthRepoImpl()),
            child: const LoginScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(
              medicinesRepo: MedicinesRepoImpl(),
            ),
            child: const HomeScreen(),
          ),
        );
      //LocationView

      case Routes.locationView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LocationCubit(
                locationRepo: LocationRepoImpl(
                    locationService: LocationService(),
                    mapController: MapController()))
              ..checkAndRequestLocationPermission(),
            child: const LocationView(),
          ),
        );

      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegisterCubit(
              registerRepo: AuthRepoImpl(),
            ),
            child: const SignupScreen(),
          ),
        );
      case Routes.forgetScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ForgetPasswordCubit(authRepo: AuthRepoImpl()),
            child: const ForgetPasswordScreen(),
          ),
        );
      case Routes.otpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                OtpPasswordCubit(otpPasswordRepo: AuthRepoImpl()),
            child: OtpScreen(otp: arguments as Map<int, dynamic>),
          ),
        );
      //ResetPasswordScreen
      case Routes.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                ResetPasswordCubit(resetPasswordRepo: AuthRepoImpl()),
            child: ResetPasswordScreen(data: arguments as Map<int, dynamic>),
          ),
        );
      case Routes.successResetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const SucessResetPasswordScreen(),
        );
      //addMedecineScreen
      case Routes.addMedecineScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                AddMedicienCubit(medicinesRepo: MedicinesRepoImpl())
                  ..addController(),
            child: const AddMedecineScreen(),
          ),
        );
      case Routes.medecineScreen:
        return MaterialPageRoute(
          builder: (_) => MedecineScreen(medicines: arguments as Medicines),
        );
      case Routes.historyScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => MedicinesCubit(),
            child: HistoryScreen(medicines: arguments as Medicines),
          ),
        );
      case Routes.detailsHistoryScreen:
        return MaterialPageRoute(
          builder: (_) => const DetailsHistoryScreen(),
        );
      case Routes.editPillScreen:
        return MaterialPageRoute(
          builder: (_) => EditPillScreen(medicines: arguments as Medicines),
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/controller/cubit/register_cubit.dart';
import 'package:pill_reminder/core/dependency_injection/dependency_injection.dart';
import 'package:pill_reminder/core/networking/dio_helpers.dart';
import 'package:pill_reminder/core/routes/app_router.dart';
import 'package:pill_reminder/core/routes/routes.dart';
import 'package:pill_reminder/core/services/bloc_observer.dart';
import 'package:pill_reminder/core/services/cache_service.dart';
import 'package:pill_reminder/core/theme/theme_app.dart';
import 'package:pill_reminder/core/utils/string_manager.dart';
import 'package:pill_reminder/model/register/register_repo/register_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await CacheService.init();
  DioHelper.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Bloc.observer = MyBlocObserver();
  dependencyInjectionSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RegisterCubit(
              registerRepo: RegisterRepoImpl(),
            ),
          ),
        ],
        child: MaterialApp(
          title: StringManager.appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeApp.light(context),
          initialRoute: Routes.loginScreen,
          onGenerateRoute: AppRouter.generateRoute,
        ),
      ),
    );
  }
}
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(375, 812),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (context, child) => MaterialApp(
//         title: StringManager.appName,
//         debugShowCheckedModeBanner: false,
//         theme: ThemeApp.light(context),
//         initialRoute: Routes.loginScreen,
//         onGenerateRoute: AppRouter.generateRoute,
//       ),
//     );
//   }
// }

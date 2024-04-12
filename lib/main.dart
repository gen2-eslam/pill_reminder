import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pill_reminder/controller/home/home_cubit.dart';
import 'package:pill_reminder/controller/medicines/medicines_cubit.dart';
import 'package:pill_reminder/controller/profile/profile_cubit.dart';
import 'package:pill_reminder/core/dependency_injection/dependency_injection.dart';
import 'package:pill_reminder/core/helper/keys.dart';
import 'package:pill_reminder/core/networking/dio_helpers.dart';
import 'package:pill_reminder/core/routes/app_router.dart';
import 'package:pill_reminder/core/routes/routes.dart';
import 'package:pill_reminder/core/services/bloc_observer.dart';
import 'package:pill_reminder/core/services/cache_service.dart';
import 'package:pill_reminder/core/theme/theme_app.dart';
import 'package:pill_reminder/core/utils/string_manager.dart';
import 'package:pill_reminder/firebase_options.dart';
import 'package:pill_reminder/model/medicines/repo/medicines_repo.dart';
import 'package:pill_reminder/model/personalData/repo/personal_data_repo.dart';
import 'package:pill_reminder/module/location/logic/cubit/location_cubit.dart';
import 'package:pill_reminder/module/location/logic/services/map_controller.dart';

import 'module/location/data/location_repo.dart';
import 'module/location/logic/services/location_service.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await CacheService.init();
  DioHelper.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });

  dependencyInjectionSetup();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? initialRoute = Routes.loginScreen;
  void requestLocationPermission() async {
    var status = await Permission.location.status;
    await Permission.location.request();
  }

  @override
  void initState() {
    initialRoute = CacheService.getDataString(key: Keys.token) != null
        ? Routes.homeScreen
        : Routes.loginScreen;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MedicinesCubit(),
          ),
          BlocProvider(
            create: (context) => ProfileCubit(
              personalDataRepo: PersonalDataRepoImpl(),
            )..getPersonalData(),
          ),
          BlocProvider(
            create: (context) => LocationCubit(
                locationRepo: LocationRepoImpl(
              locationService: LocationService(),
              mapController: MapController(),
            )),
          ),
          BlocProvider(
              create: (context) => HomeCubit(
                    medicinesRepo: MedicinesRepoImpl(),
                  )),
        ],
        child: MaterialApp(
          title: StringManager.appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeApp.light(context),
          initialRoute: initialRoute,
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

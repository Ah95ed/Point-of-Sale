import 'dart:async';
import 'dart:io';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/AppBinding.dart';
import 'package:point_of_sell/Helper/Locale/Language.dart';
import 'package:point_of_sell/Helper/Locale/LanguageController.dart';
import 'package:point_of_sell/Helper/Log/Logger.dart';
import 'package:point_of_sell/Helper/Service/Service.dart';
import 'package:point_of_sell/View/route/Route.dart';
import 'package:sizer/sizer.dart';
import 'View/Pages/WelcomeScreen.dart';

Future<void> main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await initService();
      runApp(
        const MyApp(),
      );
    },
    (error, stack) => Log.err(
      error,
      'main',
      stack,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(Languagecontroller());
    return Sizer(
      builder: (context, orientation, devicetype) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          locale: c.language,
          translations: Language(),
          initialRoute: '/',
          initialBinding: Appbinding(),
          getPages: RoutePage.routs,
          home: const RunnerApp(),
        );
      },
    );
  }
}

class RunnerApp extends StatelessWidget {
  const RunnerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      theme: FluentThemeData(),
      scrollBehavior: const ScrollBehavior(),
      home: const WelcomeScreen(),
    );
  }
}

import 'dart:async';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/AppBinding.dart';
import 'package:point_of_sell/Helper/Locale/Language.dart';
import 'package:point_of_sell/Helper/Locale/LanguageController.dart';
import 'package:point_of_sell/Helper/Log/Logger.dart';
import 'package:point_of_sell/Helper/Service/Service.dart';
import 'package:point_of_sell/View/Pages/SalesInterface/SalesInterface.dart';
import 'package:point_of_sell/View/Pages/WelcomeScreen.dart';
import 'package:point_of_sell/View/Pages/theStorage/TheStorePage.dart';
import 'package:point_of_sell/View/route/Route.dart';

bool get isDesktop {
  if (kIsWeb) return false;
  return [
    TargetPlatform.windows,
    TargetPlatform.linux,
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}

Future<void> main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await initService();
      runApp(
        const MyApp(),
      );
    },
    (
      error,
      stack,
    ) =>
        Log.err(
      error,
      'main',
      stack,
    ),
  );
  // if it's not on the web, windows or android, load the accent color
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    final c = Get.put(Languagecontroller());
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      locale: c.language,
      translations: Language(),
      initialRoute: '/',
      initialBinding: Appbinding(),
      getPages: RoutePage.routs,
      home: const RunnerApp(),
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

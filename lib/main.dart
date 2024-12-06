import 'dart:async';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/AppBinding.dart';
import 'package:point_of_sell/Helper/Locale/Language.dart';
import 'package:point_of_sell/Helper/Locale/LanguageController.dart';
import 'package:point_of_sell/Helper/Log/Logger.dart';
import 'package:point_of_sell/Helper/Service/Service.dart';
import 'package:point_of_sell/View/Pages/WelcomeScreen.dart';
import 'package:point_of_sell/View/Widget/Mobile.dart';
import 'package:point_of_sell/View/route/Navigatore/NavOBserver.dart';
import 'package:point_of_sell/View/route/Route.dart';
import 'package:point_of_sell/View/style/SizeApp/SizeApp.dart';

Future<void> main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await initService();
      runApp(
        const MyApp(),
        // DevicePreview(
        //   enabled: !kReleaseMode,
        //   builder: (context) => const MyApp(), // Wrap your app
        // ),
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

RouteObserver<Route> routeObserver = RouteObserver();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    final c = Get.put(LanguageController());
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      locale: c.language,
      translations: Language(),
      navigatorObservers: [
        NavObserver.instance,
        routeObserver,
      ],
      initialRoute: '/',
      initialBinding: Appbinding(),
      getPages: RoutePage.routs,
      home: context.isMobile ? const Mobile() : const RunnerApp(),
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

import 'dart:async';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Exaple.dart';
import 'package:point_of_sell/Helper/Locale/Language.dart';
import 'package:point_of_sell/Helper/Locale/LanguageController.dart';
import 'package:point_of_sell/Helper/Log/Logger.dart';
import 'package:point_of_sell/Helper/Service/Service.dart';
import 'package:point_of_sell/View/Pages/SaleScreen/SaleScreen.dart';
import 'package:point_of_sell/View/Pages/SalesInterface/SalesInterface.dart';
import 'package:point_of_sell/View/Pages/WelcomeScreen.dart';
import 'package:point_of_sell/View/Widget/Mobile.dart';
import 'package:point_of_sell/View/route/Route.dart';
import 'package:point_of_sell/View/style/SizeApp/DeviceUtils.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';
import 'package:point_of_sell/View/style/SizeApp/SizeBuilder.dart';

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
      'At The Main',
      stack,
    ),
  );
  // if it's not on the web, windows or android, load the accent color
}

// RouteObserver<Route> routeObserver = RouteObserver();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(LanguageController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: c.language,
      translations: Language(),
      // navigatorObservers: [
      //   NavObserver.instance,
      //   routeObserver,
      // ],
      initialRoute: '/',
      routes: RoutePage.routes,
      // initialBinding: Appbinding(),

      home: DeviceUtils.isMobile(context)
          ? SizeBuilder(
              baseSize: const Size(360, 690),
              height: context.screenHeight,
              width: context.screenWidth,
              child:  Mobile(),
            )
          : const RunnerApp(),
    );
  }
}

class RunnerApp extends StatelessWidget {
  const RunnerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SizeBuilder(
      baseSize: const Size(340, 720),
      height: context.screenHeight,
      width: context.screenWidth,
      child: FluentApp(
        showSemanticsDebugger: false,
        debugShowCheckedModeBanner: false,
        theme: FluentThemeData(),
        scrollBehavior: const ScrollBehavior(),
        home: const WelcomeScreen(),
      ),
    );
  }
}

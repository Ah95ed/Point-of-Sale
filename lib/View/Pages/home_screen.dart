import 'package:flutter/material.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  // final c = Get.put(LanguageController());
  // final Scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: Scaffoldkey,
      body:  Center(
        child: Image.asset(
                'assets/image/show.png',
                fit: BoxFit.cover,
                height: context.screenWidth,
                width: context.screenHeight,
                alignment: Alignment.center,
              ),
      )
    );
  }
}

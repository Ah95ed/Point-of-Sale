import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Helper/Locale/LanguageController.dart';
import 'package:point_of_sell/View/Widget/Mobile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final c = Get.put(LanguageController());
  final Scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Scaffoldkey,
      drawer: const DrawerAllApp(),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Image.asset(
          'assets/image/show.png',
        ),
      ),
    );
  }
}

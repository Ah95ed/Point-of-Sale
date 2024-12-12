import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Helper/Locale/LanguageController.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final c = Get.put(LanguageController());
  final Scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Scaffoldkey,
      body:  Center(
        child: Image.asset(
                'assets/image/show.png',
                fit: BoxFit.cover,
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                alignment: Alignment.center,
              ),
      )
         
     
    );
  }
}

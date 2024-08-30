import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/WelcomeController.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Pages/SalesInterface/SalesInterface.dart';
import 'package:point_of_sell/View/Pages/theStorage/TheStorePage.dart';
import 'package:point_of_sell/View/style/SizeApp/SizeApp.dart';
import '../Pages/home_screen.dart';

class Mobile extends StatelessWidget {
  const Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SaleofPoint'.tr),
      ),
      drawer: const DrawerAllApp(),
      body: HomeScreen(),
    );
  }
}

class DrawerAllApp extends StatelessWidget {
  const DrawerAllApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorUsed.whitesoft,
      child: GetBuilder<WelcomeController>(
        init: WelcomeController(),
        builder: (controller) {
          return ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
               SizedBox(
                height: context.getHeight(20),
              ),
              ListTile(
                leading: const Icon(Icons.store),
                title: Text('SalesInterface'.tr),
                onTap: () {
                  Navigator.pop(context);
                  Get.off(SalesInterface());
                },
              ),
              ListTile(
                leading: const Icon(Icons.satellite),
                title: const Text(''),
                onTap: () {
                  // Close the drawer and navigate to the Home screen
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  // Close the drawer and navigate to the Settings screen
                  Navigator.pop(context);
                  Get.off(TheStorePage());
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => AddItem(),
                  //   ),
                  // );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

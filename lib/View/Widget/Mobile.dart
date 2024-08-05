import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/WelcomeController.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Pages/theStorage/TheStorePage.dart';

import '../Pages/home_screen.dart';

class Mobile extends StatelessWidget {
  const Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SaleofPoint'.tr),
      ),
      drawer: Drawer(
        backgroundColor: ColorUsed.whitesoft,
        child: GetBuilder<WelcomeController>(
          init: WelcomeController(),
          builder: (controller) {
            return ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                // DrawerHeader(child: Container()),
                const SizedBox(
                  height: 40.0,
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: Text('Home'.tr),
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
      ),
      body:  HomeScreen(),
    );
  }
}

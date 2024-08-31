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
                height: context.getHeight(4),
              ),
                const Divider(),
              ListTile(

                leading: const Icon(Icons.shop),
                title: Text('SalesInterface'.tr),
                onTap: () {
                  Navigator.pop(context);
                  Get.off(() => SalesInterface());
                },

              ),
             const Divider(),
               ListTile(

              leading: const Icon(Icons.store),
                      onTap: () {
                        Navigator.pop(context);
                        Get.off(() => TheStorePage());
                      },
                       title:  Text("store".tr),
                
              ),

            ],
          );
        },
      ),
    );
  }
}

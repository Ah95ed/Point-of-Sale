import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/MobileContrller/MobileContrller.dart';
import 'package:point_of_sell/Helper/Locale/Language.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';

class Mobile extends StatelessWidget {
  Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileScreen(),
    );
  }
}

class MobileScreen extends StatelessWidget {
  MobileScreen({super.key});

  final Scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MobileContrller>(
      init: MobileContrller(),
      builder: (c) {
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Are U sure Exit'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('No'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        SystemNavigator.pop();
                      },
                      child: const Text('Yes'),
                    ),
                  ],
                );
              },
            );
          },
          child: Scaffold(
            key: Scaffoldkey,
            drawer: Drawer(
              backgroundColor: ColorUsed.whitesoft,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(
                    height: context.getHeight(20),
                  ),
                  ListTile(
                    leading: const Icon(Icons.store),
                    onTap: () {
                      Scaffoldkey.currentState!.closeDrawer();
                      c.changeIndex(0);
                    },
                    title: Text('Home'.tr),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.shop),
                    title: Text('SalesInterface'.tr),
                    onTap: () {
                      Scaffoldkey.currentState!.closeDrawer();
                      c.changeIndex(1);
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.store),
                    onTap: () {
                      Scaffoldkey.currentState!.closeDrawer();
                      c.changeIndex(2);
                    },
                    title: Text(Language.AddItems.tr),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.person_add),
                    onTap: () {
                      Scaffoldkey.currentState!.closeDrawer();
                      c.changeIndex(3);
                    },
                    title: Text(Language.Customer.tr),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.explore_outlined),
                    onTap: () {
                      Scaffoldkey.currentState!.closeDrawer();
                      c.changeIndex(4);
                    },
                    title: Text(Language.ExportAndimport.tr),
                  ),
                  const Divider(),
                  // ListTile(
                  //   leading: const Icon(Icons.explore_outlined),
                  //   onTap: () {
                  //     Scaffoldkey.currentState!.closeDrawer();
                  //     c.changeIndex(5);
                  //   },
                  //   title: Text(Language.AddAccount.tr),
                  // ),
                  // const Divider(),
                ],
              ),
            ),
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Point of Sell'),
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffoldkey.currentState!.openDrawer();
                },
              ),
            ),
            body: c.addNav[0],
          ),
        );
      },
    );
  }
}

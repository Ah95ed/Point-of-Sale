import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/WelcomeController.dart';
import 'package:point_of_sell/Helper/Locale/Language.dart';
import 'package:point_of_sell/Helper/Log/LogApp.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Pages/AddItems/AddItems.dart';
import 'package:point_of_sell/View/Pages/CustomerManagement/CustomerManagement.dart';
import 'package:point_of_sell/View/Pages/SalesInterface/SalesInterface.dart';
import 'package:point_of_sell/View/Pages/Sellforcash/AddAccount.dart';
import 'package:point_of_sell/View/Pages/home_screen.dart';
import 'package:point_of_sell/View/Widget/DrawerApp/DrawerApp.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';
import 'package:point_of_sell/View/style/SizeApp/SizeBuilder.dart';

class Mobile extends StatelessWidget {
  Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileScreen(),
    );
  }
}

class MobileScreen extends StatefulWidget {
  MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  final Scaffoldkey = GlobalKey<ScaffoldState>();

  int index = 1;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          Navigator.pop(context);
        }
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
                  leading: const Icon(Icons.shop),
                  title: Text('SalesInterface'.tr),
                  onTap: () {
                    Scaffoldkey.currentState!.closeDrawer();
                    setState(() {
                      index = 0;
                    });
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.store),
                  onTap: () {
                    Scaffoldkey.currentState!.closeDrawer();
                    setState(() {
                      index = 1;
                    });
                  },
                  title: Text(Language.AddItems.tr),
                ),
                // const Divider(),
                // ListTile(
                //   leading: const Icon(Icons.person_add),
                //   onTap: () {
                //     Navigator.pop(context);
                //     Get.off(() => const CustomerManagement());
                //   },
                //   title: Text(Language.Customer.tr),
                // ),
                const Divider(),
              ],
            ),
          ),
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Point of Sell'),
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                logSuccess('message');
                Scaffoldkey.currentState!.openDrawer();
              },
            ),
          ),
          body: IndexedStack(
            index: index,
            children: [
              Navigator(
                onGenerateRoute: (settings) {
                  return MaterialPageRoute(
                    builder: (context) {
                      return const SalesInterface();
                    },
                  );
                },
              ),
              Navigator(
                onGenerateRoute: (settings) {
                  return MaterialPageRoute(
                    builder: (context) {
                      return const AddItems();
                    },
                  );
                },
              ),
              // HomeScreen(),
              // const SalesInterface(),
              // const CustomerManagement(),
            ],
          )),
    );
  }
}

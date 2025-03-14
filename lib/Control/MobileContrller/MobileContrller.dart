import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/View/Pages/AddItems/AddItems.dart';
import 'package:point_of_sell/View/Pages/CustomerManagement/CustomerManagement.dart';
import 'package:point_of_sell/View/Pages/SaleList/SaleList_Screen.dart';
import 'package:point_of_sell/View/Pages/SalesInterface/SalesInterface.dart';
import 'package:point_of_sell/View/Pages/home_screen.dart';


class MobileContrller extends GetxController {
  
  List<Navigator> navigators = [
    Navigator(
      key: GlobalKey<NavigatorState>(),
      onGenerateRoute:
          (route) => MaterialPageRoute(builder: (context) => HomeScreen()),
    ),
    Navigator(
      key: GlobalKey<NavigatorState>(),
      onGenerateRoute:
          (route) =>
              MaterialPageRoute(builder: (context) => const SalesInterface()),
    ),
    Navigator(
      key: GlobalKey<NavigatorState>(),
      onGenerateRoute:
          (route) => MaterialPageRoute(builder: (context) => const AddItems()),
    ),
    Navigator(
      key: GlobalKey<NavigatorState>(),
      onGenerateRoute:
          (route) =>
              MaterialPageRoute(builder: (context) => CustomerManagement()),
    ),
    // Navigator(
    //   key: GlobalKey<NavigatorState>(),
    //   onGenerateRoute:
    //       (route) => MaterialPageRoute(builder: (context) => ExportAndImport()),
    // ),
    Navigator(
      key: GlobalKey<NavigatorState>(),
      onGenerateRoute:
          (route) =>
              MaterialPageRoute(builder: (context) => const InvoicePage()),
    ),
  ];

  late List<Navigator> addNav = [navigators[0]];

  Future<void> changeIndex(int index) async {
    addNav.clear();
    addNav.add(navigators[index]);
    // addNav = [];
    update();
  }
}

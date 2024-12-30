import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/View/Pages/AddItems/AddItems.dart';
import 'package:point_of_sell/View/Pages/SalesInterface/SalesInterface.dart';
import 'package:point_of_sell/View/Pages/UpdateData/UpdateData.dart';
import 'package:point_of_sell/View/Pages/WelcomeScreen.dart';
import 'package:point_of_sell/View/Pages/home_screen.dart';

class RoutePage {
  static const String homeViewPage = '/HomeView';
  static const String addItemPage = '/AddItem';
  static const String welcomePage = '/WelcomeScreen';
  static const String updatePage = '/UpdateScreen';
  static const String salePage = '/SalesScreen';
  static const String Updatedata = '/UpdateData';

 static Map<String, Widget Function(BuildContext)> routes = {
    homeViewPage: (context) => HomeScreen(),
    addItemPage: (context) => const AddItems(),
    welcomePage: (context) => const WelcomeScreen(),

    salePage: (context) => const SalesInterface(),

  };
}

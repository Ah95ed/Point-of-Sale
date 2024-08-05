import 'package:get/get.dart';
import 'package:point_of_sell/AppBinding.dart';
import 'package:point_of_sell/View/Pages/HomeView.dart';
import 'package:point_of_sell/View/Pages/SaleScreen/SaleScreen.dart';
import 'package:point_of_sell/View/Pages/UpdatePrice.dart';
import 'package:point_of_sell/View/Pages/WelcomeScreen.dart';

class RoutePage {
  static const String homeViewPage = '/HomeView';
  static const String addItemPage = '/AddItem';
  static const String welcomePage = '/WelcomeScreen';
  static const String updatePage = '/UpdateScreen';
  static const String salePage = '/SalesScreen';

  static List<GetPage> routs = [
    GetPage(name: homeViewPage, page: () => HomeView()),
    GetPage(name: welcomePage, page: () => const WelcomeScreen()),
    GetPage(name: updatePage, page: () => UpdatePrice(), binding: Appbinding()),
    GetPage(name: salePage, page: () =>  SaleScreen()),
  ];
}

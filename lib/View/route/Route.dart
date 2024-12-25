import 'package:get/get.dart';
import 'package:point_of_sell/View/Pages/SaleScreen/SaleScreen.dart';
import 'package:point_of_sell/View/Pages/UpdateData/UpdateData.dart';
import 'package:point_of_sell/View/Pages/WelcomeScreen.dart';

class RoutePage {
  static const String homeViewPage = '/HomeView';
  static const String addItemPage = '/AddItem';
  static const String welcomePage = '/WelcomeScreen';
  static const String updatePage = '/UpdateScreen';
  static const String salePage = '/SalesScreen';
  static const String Updatedata = '/UpdateData';

  static List<GetPage> routs = [
    // GetPage(name: homeViewPage, page: () => HomeView()),
    GetPage(name: welcomePage, page: () => const WelcomeScreen()),
    // GetPage(name: updatePage, page: () => UpdatePrice()),
    GetPage(name: salePage, page: () =>  const SaleScreen()),
     
  ];
}

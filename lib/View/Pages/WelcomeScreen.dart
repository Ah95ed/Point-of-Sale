import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/WelcomeController.dart';
import 'package:point_of_sell/View/Pages/SalesInterface/SalesInterface.dart';
import 'package:point_of_sell/View/Pages/Sellforcash/AddAccount.dart';
import 'package:point_of_sell/View/Pages/theStorage/TheStorePage.dart';
import 'package:point_of_sell/View/Pages/PayCash/PayCash.dart';
import 'package:point_of_sell/View/Pages/SaleScreen/SaleScreen.dart';
import 'package:point_of_sell/View/Pages/UpdatePrice.dart';
import 'package:point_of_sell/View/Pages/home_screen.dart';
import 'package:point_of_sell/View/Pages/the_purchasePage/purchase.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      init: WelcomeController(),
      builder: (controller) {
        return NavigationView(
          pane: NavigationPane(
            selected: controller.selecte,
            size: NavigationPaneSize(
              openMaxWidth: Get.width * 0.15,
              openMinWidth: Get.width * 0.11,
            ),
            items: [
              PaneItem(
                title: Text('welcomescreen'.tr),
                icon: const Icon(Icons.add),
                body: HomeScreen(),
              ),
              PaneItem(
                icon: const Icon(Icons.store),
                body:  SalesInterface(),
                title: Text('SalesInterface'.tr),
              ),
              PaneItem(
                icon: const Icon(Icons.store),
                body: TheStorePage(),
                title: Text("store".tr),
              ),
              PaneItem(
                title: Text('salescreen'.tr),
                icon: const Icon(Icons.price_change_sharp),
                body: const SaleScreen(),
              ),
              PaneItem(
                title: const Text('The Purchase'),
                icon: const Icon(Icons.view_agenda),
                body: const Purchase(),
              ),
              PaneItem(
                title: const Text('Pay Cash'),
                icon: const Icon(Icons.view_agenda),
                body: const PayCash(),
              ),
              // PaneItem(
              //   icon: const Icon(Icons.account_balance),
              //   body: const AccountOrders(),
              //   title: const Text("AccountOrders"),
              // ),
              PaneItem(
                icon: const Icon(Icons.update_sharp),
                body: UpdatePrice(),
                title: const Text("UpdatePrice"),
              ),
              PaneItem(
                icon: const Icon(Icons.add_sharp),
                body: AddAccount(),
                title: const Text("AddAccount"),
              ),
            ],
            onChanged: (value) {
              controller.selected(value);
            },
          ),
        );
      },
    );
    // : const Mobile();
  }
}

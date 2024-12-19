import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/WelcomeController.dart';
import 'package:point_of_sell/Helper/Locale/Language.dart';
import 'package:point_of_sell/View/Pages/AddItems/TheStorePage.dart';
import 'package:point_of_sell/View/Pages/CustomerManagement/CustomerManagement.dart';
import 'package:point_of_sell/View/Pages/SalesInterface/SalesInterface.dart';
import 'package:point_of_sell/View/Pages/home_screen.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';

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
              openMaxWidth: context.sizeBuilder.width/3,
              openMinWidth:context.sizeBuilder.width /4 ,
            ),
            items: [
              PaneItem(
                title: Text('welcomescreen'.tr),
                icon: const Icon(Icons.add),
                body: HomeScreen(),
              ),
              PaneItem(
                icon: const Icon(Icons.store),
                body: const SalesInterface(),
                title: Text('SalesInterface'.tr),
              ),
              PaneItem(
                icon: const Icon(Icons.store),
                body: const AddItems(),
                title: Text("store".tr),
              ),
              PaneItem(
                title: Text(Language.Customer.tr),
                icon: const Icon(Icons.price_change_sharp),
                body: const CustomerManagement(),
              ),
              // PaneItem(
              //   title: const Text('The Purchase'),
              //   icon: const Icon(Icons.view_agenda),
              //   body: const Purchase(),
              // ),
              // PaneItem(
              //   title: const Text('Pay Cash'),
              //   icon: const Icon(Icons.view_agenda),
              //   body: const PayCash(),
              // ),
              // PaneItem(
              //   icon: const Icon(Icons.account_balance),
              //   body: const AccountOrders(),
              //   title: const Text("AccountOrders"),
              // ),
              // PaneItem(
              //   icon: const Icon(Icons.update_sharp),
              //   body: UpdatePrice(),
              //   title: const Text("UpdatePrice"),
              // ),
              // PaneItem(
              //   icon: const Icon(Icons.add_sharp),
              //   body: AddAccount(),
              //   title: const Text("AddAccount"),
              // ),
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

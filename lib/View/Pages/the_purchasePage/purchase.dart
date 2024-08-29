
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/View/Pages/the_purchasePage/PurchaselistBody.dart';
import 'package:point_of_sell/View/Widget/PurshaseWidget/MultiButtonModifyPurchase.dart';
import 'package:point_of_sell/View/Widget/PurshaseWidget/TableInPurchase.dart';
import 'package:point_of_sell/View/Widget/PointSalewidget/textFieldDropdown.dart';

class Purchase extends StatelessWidget {
  const Purchase({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: const Duration(milliseconds: 400),
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          tabs: [
            Tab(text: 'Purchaselist'.tr),
            Tab(text: 'Modifypurchase'.tr),
          ],
        ),
        body: TabBarView(
          children: [
            PurchaselistBody(),
            ModifypurchaseBody(),
          ],
        ),
      ),
    );
  }
}

class ModifypurchaseBody extends StatelessWidget {
  ModifypurchaseBody({super.key});
  final width = Get.width;
  final height = Get.height;
  // final statusbarpage = Get.;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // 0.1
          SizedBox(
            height: height * 0.1,
            width: width,
            child: const Row(
              children: [
                Expanded(
                  child: TextFieldDropdown(),
                ),
                Expanded(
                  child: TextFieldDropdown(),
                ),
                Expanded(
                  child: TextFieldDropdown(),
                ),
              ],
            ),
          ),
          // 0.5
          const TableInPurchase(),

          MultiButtonModifyPushae(height: height, width: width),
          //! here complete List viwe
        ],
      ),
    );
  }
}

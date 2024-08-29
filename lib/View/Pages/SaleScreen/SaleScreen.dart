import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/View/Pages/SaleScreen/PoinOfSaleBody.dart';
import 'package:point_of_sell/View/Widget/PointSalewidget/SaleListBody.dart';

class SaleScreen extends StatelessWidget {
  const SaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: const Duration(milliseconds: 400),
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          tabs: [
            Tab(text: 'pointofsale'.tr),
            Tab(text: 'salelist'.tr),
          ],
        ),
        body: TabBarView(
          children: [
            PointOfSaleBody(),
            SaleListBody(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/View/Pages/AccountOrders.dart';
import 'package:point_of_sell/View/SizeApp/SizeApp.dart';

class SalesInterface extends StatelessWidget {
  const SalesInterface({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: getHeight(10),
              width: getWidth(100),
              child: TabBar(
                tabs: [
                  Tab(icon: const Icon(Icons.home), text: 'ShowItems'.tr),
                  const Tab(icon: Icon(Icons.person), text: "Profile"),
                ],
              ),
            ),
            SizedBox(
              height: getHeight(90),
              width: getWidth(100),
              child: const TabBarView(
                children: [
                  Center(child: Text("Home Tab")),
                  AccountOrders(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

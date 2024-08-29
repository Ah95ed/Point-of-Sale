import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/HomeController.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Pages/AccountOrders.dart';
import 'package:point_of_sell/View/style/SizeApp/SizeApp.dart';

class SalesInterface extends StatelessWidget {
  SalesInterface({super.key});

  HomeController c = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    c.paginationData();
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
              child: TabBarView(
                children: [
                  ShowAllItem(),
                  const AccountOrders(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShowAllItem extends StatelessWidget {
  ShowAllItem({super.key});

  HomeController c = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: c.items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.isMobile ? 2 : 4,
      ),
      itemBuilder: (context, index) {
        return Card(
          color: ColorUsed.whitesoft,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    c.items[index].name,
                    style: TextStyle(
                        fontSize: context.getFontSize(6),
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

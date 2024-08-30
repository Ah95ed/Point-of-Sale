import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/HomeController.dart';
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
        return CustomCardView(
          title: c.items[index].name,
          sale: c.items[index].sale,
          buy: c.items[index].buy,
          onTap: () {},
        );
      },
    );
  }
}

class CustomCardView extends StatelessWidget {
  final String title;
  final String sale;
  final String buy;
  final VoidCallback onTap;

  const CustomCardView({
    super.key,
    required this.title,
    required this.sale,
    required this.buy,
    required this.onTap,
  });
  Color getRandomColor() {
    final random = Random();
    return Color.fromRGBO(
      random.nextInt(256), // Red
      random.nextInt(256), // Green
      random.nextInt(256), // Blue
      1, // Alpha (opacity)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.getWidth(1), vertical: context.getHeight(1)),
      child: Container(
        height:context.getHeight(12),
        width: context.getWidth(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:getRandomColor(),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
                child: Icon(Icons.code, size: context.getWidth(5)),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      sale,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

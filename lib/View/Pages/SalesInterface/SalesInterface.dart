import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/HomeController.dart';
import 'package:point_of_sell/Helper/Locale/Language.dart';
import 'package:point_of_sell/View/Pages/AccountOrders.dart';
import 'package:point_of_sell/View/Widget/Mobile.dart';
import 'package:point_of_sell/View/style/SizeApp/SizeApp.dart';

class SalesInterface extends StatefulWidget {
  const SalesInterface({super.key});

  @override
  State<SalesInterface> createState() => _SalesInterfaceState();
}

class _SalesInterfaceState extends State<SalesInterface> {
  HomeController c = Get.put(HomeController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    c.paginationData();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.getHeight(100),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: context.isMobile ? const DrawerAllApp() : null,
          appBar: context.isMobile ? AppBar() : null,
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
            child: Column(
              children: [
                SizedBox(
                  height: context.getHeight(8),
                  width: context.getWidth(100),
                  child: TabBar(
                    tabs: [
                      Tab(
                          icon: const Icon(Icons.home),
                          text: Language.showAllItem.tr),
                      Tab(
                          icon: const Icon(Icons.person),
                          text: Language.sales.tr),
                    ],
                  ),
                ),
                SizedBox(
                  height: context.isMobile
                      ? context.getHeight(92) -
                          context.getAppBarHeightWithStatusBar()
                      : context.getHeight(92),
                  width: context.getWidth(100),
                  child: const TabBarView(
                    children: [
                      ShowAllItem(),
                      AccountOrders(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShowAllItem extends StatelessWidget {
  const ShowAllItem({super.key});
  

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (c) {
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
  final List<Color> c = const [
    Color(0xFFAC9B88),
    Color.fromARGB(255, 126, 118, 110),
    Color.fromARGB(255, 238, 233, 183),
    Color.fromARGB(255, 213, 147, 142),
    Color.fromARGB(255, 250, 202, 157),
    Color.fromARGB(255, 192, 183, 189),
    Color.fromARGB(255, 199, 227, 221),
  ];
  Color getRandomColor() {
    c.shuffle();
    return c.first;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.getWidth(1),
        vertical: context.getHeight(1),
      ),
      child: Container(
        height: context.getHeight(12),
        width: context.getWidth(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white70,
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

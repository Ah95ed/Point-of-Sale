import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/HomeController.dart';
import 'package:point_of_sell/Helper/Locale/Language.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Pages/AccountOrders.dart';
import 'package:point_of_sell/View/Widget/AlertDialog.dart';
import 'package:point_of_sell/View/Widget/AllItems.dart';
import 'package:point_of_sell/View/Widget/Mobile.dart';
import 'package:point_of_sell/View/style/SizeApp/SizeApp.dart';

class SalesInterface extends StatefulWidget {
  const SalesInterface({super.key});

  @override
  State<SalesInterface> createState() => _SalesInterfaceState();
}

class _SalesInterfaceState extends State<SalesInterface> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.getHeight(100),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: context.isMobile ? const DrawerAllApp() : null,
          appBar: AppBar(
            centerTitle: true,
            title: TabBar(
              tabs: [
                Tab(
                    icon: const Icon(Icons.home),
                    text: Language.showAllItem.tr),
                Tab(
                  icon: const Icon(Icons.person),
                  text: Language.sales.tr,
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
            child: Column(
              children: [
                SizedBox(
                  height: context.getHeight(100),
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
      init: HomeController(),
      builder: (c) {
        return Container(
          color: ColorUsed.whitesoft,
          height: context.getHeight(100),
          child: GridView.builder(
            itemCount: c.items.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: context.isMobile ? 1 : 3,
              childAspectRatio: context.isMobile ? 2 : 4,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              return AllItems(
                () {
                  showDialog(
                    context: context,
                    builder: (context) => const CustomAlertDialog(),
                  );
                },
                name: c.items[index].name,
                sale: c.items[index].sale,
                // onPressed: () {},
              );
            },
          ),
        );
      },
    );
  }
}

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Delete'),
        ),
   
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Edit'),
        ),
      ],
    );
  }
}

class CustomCardView extends StatelessWidget {
  final String title;
  final String sale;
  final String buy;
  final VoidCallback onTap;

  CustomCardView({
    super.key,
    required this.title,
    required this.sale,
    required this.buy,
    required this.onTap,
  });
  final List<Color> c = [
    const Color(0xFFAC9B88),
    const Color.fromARGB(255, 126, 118, 110),
    const Color.fromARGB(255, 238, 233, 183),
    const Color.fromARGB(255, 213, 147, 142),
    const Color.fromARGB(255, 250, 202, 157),
    const Color.fromARGB(255, 192, 183, 189),
    const Color.fromARGB(255, 199, 227, 221),
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
          color: getRandomColor(),
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
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
                child: Icon(
                  Icons.code,
                  size: context.getWidth(5),
                ),
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

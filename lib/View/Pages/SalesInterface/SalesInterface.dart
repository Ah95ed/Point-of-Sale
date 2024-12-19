import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/AccountController.dart';
import 'package:point_of_sell/Control/HomeController.dart';
import 'package:point_of_sell/Helper/Locale/Language.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Pages/SalesInterface/AccountOrders.dart';
import 'package:point_of_sell/View/Widget/AllItems.dart';
import 'package:point_of_sell/View/Widget/Mobile.dart';
import 'package:point_of_sell/View/style/SizeApp/DeviceUtils.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';
import 'package:point_of_sell/View/style/SizeApp/SizeBuilder.dart';

class SalesInterface extends StatefulWidget {
  const SalesInterface({super.key});

  @override
  State<SalesInterface> createState() => _SalesInterfaceState();
}

class _SalesInterfaceState extends State<SalesInterface> {
  @override
  void initState() {
    super.initState();
    Get.put(HomeController());
    Get.put(AccountController());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorUsed.whitesoft,
        drawer: DeviceUtils.isMobile(context) ? const DrawerAllApp() : null,
        appBar: AppBar(
          centerTitle: true,
          title: TabBar(
            tabs: [
              Tab(
                icon: const Icon(Icons.home),
                text: Language.showAllItem.tr,
              ),
              Tab(
                icon: const Icon(Icons.person),
                text: Language.sales.tr,
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ShowAllItem(),
            AccountOrders(),
          ],
        ),
      ),
    );
  }
}

class ShowAllItem extends StatelessWidget {
  const ShowAllItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizeBuilder(
      baseSize: const Size(200, 200),
      height: context.getMinSize(200),
      width: context.getMinSize(200),
      child: Builder(builder: (context) {
        return GridView.builder(
            itemCount: 8,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: DeviceUtils.valueDecider(
                context,
                onMobile: 2,
                onTablet: 3,
                onDesktop: 4,
                others: 2,
              ),
              childAspectRatio: 4,

              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemBuilder: (context, index) {
              return AllItems(
                () {},
                name: 'Ahmed',
                sale: '1000',
              );
            });
      }),
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

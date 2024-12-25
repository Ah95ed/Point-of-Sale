import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/AccountController.dart';
import 'package:point_of_sell/Control/HomeController.dart';
import 'package:point_of_sell/Helper/Locale/Language.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Pages/SalesInterface/AccountOrders.dart';
import 'package:point_of_sell/View/Pages/UpdateData/UpdateData.dart';
import 'package:point_of_sell/View/Pages/UpdatePrice/UpdatePrice.dart';
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
    // Get.put(HomeController());
    Get.put(AccountController());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
              const Tab(
                icon: Icon(Icons.update),
                text: 'Update Prcice',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const ShowAllItem(),
            const AccountOrders(),
            UpdatePrice(),
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
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return SizeBuilder(
          baseSize: const Size(200, 200),
          height: context.getMinSize(200),
          width: context.getMinSize(200),
          child: Builder(
            builder: (context) {
              return GridView.builder(
                itemCount: controller.items.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: DeviceUtils.valueDecider(
                    context,
                    onMobile: 2,
                    onTablet: 3,
                    onDesktop: 3,
                    others: 2,
                  ),
                  childAspectRatio: 4,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemBuilder: (context, index) {
                  return AllItems(
                    () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return  CustomAlertDialog({
                            'id': controller.items[index].id,
                            'name': controller.items[index].name,
                            'sale': controller.items[index].sale,
                            'buy': controller.items[index].buy,
                            'quantity': controller.items[index].quantity,
                            'date': controller.items[index].date,
                            'code': controller.items[index].code,
                            'company': controller.items[index].company,
                            
                            });
                        },
                      );
                    },
                    name: controller.items[index].name,
                    sale: controller.items[index].sale,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

class CustomAlertDialog extends StatelessWidget {
   CustomAlertDialog( this.data,{super.key} );
   final Map<String,dynamic> data;

   HomeController c  = Get.find();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return UpdateData(
                    named: data['name'],
                    coded: data['code'],
                    saled: data['sale'],
                    buyt: data['buy'],
                    quan: data['quantity'],
                    id: data['id'],
                    dated: data['date'],
                    company: data['company'],

                  );
                },
              ),
            );
          },
          child: Text(Language.edit.tr),
        ),
        TextButton(
          onPressed: () {
            c.deleteItem(data['id']);
            Navigator.pop(context);
          },
          child: Text(Language.delete.tr),
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

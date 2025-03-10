import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/MobileContrller/MobileContrller.dart';
import 'package:point_of_sell/Helper/Locale/Language.dart';

// class Mobile extends StatelessWidget {
//   Mobile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: MobileScreen());
//   }
// }

class MobileScreen extends StatelessWidget {
  MobileScreen({super.key});

  final Scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MobileContrller>(
      init: MobileContrller(),
      builder: (c) {
        return PopScope(
          canPop: false,
          
          onPopInvoked: (didPop) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Are U sure Exit'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('No'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        SystemNavigator.pop();
                      },
                      child: const Text('Yes'),
                    ),
                  ],
                );
              },
            );
          },
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Point of Sell'),
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      opaque: false,
                      barrierColor: Colors.black.withOpacity(
                        0.5,
                      ),
                      barrierDismissible: true, // تعتيم الخلفية
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: context.width / 1.5, // نصف عرض الشاشة
                            color: Colors.white,
                            child: Scaffold(
                              body: ListView(
                                children: [
                                  const Divider(),
                                  ListTile(
                                    title: const Text('Home'),
                                    onTap: () {
                                      Navigator.pop(context);
                                      c.changeIndex(0);
                                    },
                                  ),
                                  const Divider(),
                                  ListTile(
                                    title: const Text('Sales Interface'),
                                    onTap: () {
                                      Navigator.pop(context);
                                      c.changeIndex(1);
                                    },
                                  ),
                                  const Divider(),
                                  ListTile(
                                    title: const Text('Add Items'),
                                    onTap: () {
                                      Navigator.pop(context);
                                      c.changeIndex(2);
                                    },
                                  ),
                                  const Divider(),
                                  ListTile(
                                    title: const Text('Customer Management'),
                                    onTap: () {
                                      Navigator.pop(context);
                                      c.changeIndex(3);
                                    },
                                  ),
                                  const Divider(),

                                  // ListTile(
                                  //   title: const Text('Export'),
                                  //   onTap: () {
                                  //     Navigator.pop(context);
                                  //     c.changeIndex(4);
                                  //   },
                                  // ),
                                  ListTile(
                                    title:  Text(Language.saleList.tr),
                                    onTap: () {
                                        Navigator.pop(context);
                                      c.changeIndex(4);
                                    },
                                  ),
                                ],
                              ), // ضع هنا المحتوى الذي تريده
                            ),
                          ),
                        );
                      },
                      transitionsBuilder: (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(-1, 0),
                            end: const Offset(0, 0),
                          ).animate(animation),
                          child: child,
                        );
                      },
                    ),
                  );
                },
              ),
            ),

            body: c.addNav[0],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Control/HomeController.dart';
import '../Pages/UpdateData.dart';
import 'AllItems.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});

  // HomeController controller;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return controller.items.isEmpty
            ? Builder(builder: (context) {
                return const Center(
                  child: Text(
                    'Empty ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                );
              })
            : Column(
                children: [
                  // Items
                  Expanded(
                    flex: 4,
                    child: ListView.builder(
                      controller: controller.controller,
                      itemCount: controller.isLaodingMore
                          ? controller.items.length + 1
                          : controller.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AllItems(
                          name: controller.items[index].name,
                          sale: controller.items[index].sale,
                          () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                final width = MediaQuery.of(context).size.width;
                                return AlertDialog(
                                  title: const Text("S.current.select "),
                                  actions: [
                                    Row(
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                            Get.to(
                                              UpdateData(
                                                named: controller
                                                    .items[index].name,
                                                coded: controller
                                                    .items[index].code,
                                                saled: controller
                                                    .items[index].sale,
                                                buyt:
                                                    controller.items[index].buy,
                                                quan: controller
                                                    .items[index].quantity,
                                                id: controller.items[index].id,
                                              ),
                                            );
                                          },
                                          child: const Text(
                                            "S.of(context).edit",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width / 5,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            controller.deleteItem(
                                                controller.items[index].id);
                                            Get.back();
                                          },
                                          child: const Text(
                                            " S.of(context).delete",
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 22,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
      },
    );
  }
}

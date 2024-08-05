import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/AccountController.dart';
import 'package:point_of_sell/View/Widget/AllItems.dart';

class CardAccount extends StatelessWidget {
  const CardAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
      init: AccountController(),
      builder: (controller) {
        return Column(
          children: [
            Expanded(
              flex: 4,
              child: ListView.builder(
                itemCount: controller.search.length,
                itemBuilder: (BuildContext context, int index) {
                  return AllItems(
                    name: controller.search[index].name,
                    sale: controller.search[index].sale,
                    onPressed: () async {
                      if (controller.search.isEmpty) {
                        return;
                      }
                      await controller.deleteItem(
                        controller.search[index].id,
                        controller.search[index].sale,
                      );
                      // controller.update();
                    },
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}

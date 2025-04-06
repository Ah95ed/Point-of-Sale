import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/AccountController.dart';
import 'package:point_of_sell/View/Widget/TextField.dart';

class AlertDialogCustom extends StatelessWidget {
 late String id_customer;
  AlertDialogCustom({super.key});
  AlertDialogCustom.FrtomAccount(String id_customer) {
    this.id_customer = id_customer;
  }
  final c = Get.lazyPut(() => AccountController());

  AccountController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Count Item '),
      content: TextFieldCustom(
        name: 'name',
        icons: Icons.numbers,
        text: controller.text,
        input: TextInputType.number,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                controller.text.clear();
                
                Get.back();
              },
              icon: const Icon(Icons.close),
            ),
            IconButton(
              onPressed: () {
                controller.addSaleAndupdatePrice(id_customer);
                controller.text.clear();
                Get.back();
              },
              icon: const Icon(Icons.done),
            ),
          ],
        ),
      ],
    );
  }
}

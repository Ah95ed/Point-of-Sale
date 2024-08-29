import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/SizeApp/SizeApp.dart';
import 'package:point_of_sell/View/Widget/AllItems.dart';
import '../../Control/AccountController.dart';

// ignore: must_be_immutable
class AccountOrders extends StatefulWidget {
 const AccountOrders({super.key});

  @override
  State<AccountOrders> createState() => _AccountOrdersState();
}

class _AccountOrdersState extends State<AccountOrders> {
  final ch = Get.put(AccountController());

  @override
  void initState() {
    super.initState();
    ch.getDataFromAccount();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
        init: AccountController(),
        builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: getHeight(8),
                padding: const EdgeInsets.all(4.0),
                child: TextFormField(
                  controller: controller.controller,
                  onChanged: (value) {
                    if (value.isEmpty) return;
                    controller.searchCodeOrder(value);
                  },
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  // controller: text,
                  decoration: const InputDecoration(
                    labelText: 'name',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getHeight(70),
                child: ListView.builder(
                  itemCount: controller.search.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AllItems(
                      name: controller.search[index].name,
                      sale: controller.search[index].sale,
                      onPressed: () async {
                        if (controller.search.isEmpty) return;
                        log('message onClick  ${controller.search[index].id}');
                        await controller.deleteItem(
                          controller.search[index].id,
                          controller.search[index].sale,
                        );
                        controller.update();
                        controller.getDataFromAccount();
                      },
                    );
                  },
                ),
              ),
              Container(
                color: ColorUsed.lightBlue,
                height: getHeight(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Result : ${controller.resultSell} ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: getFontSize(8),
                      ),
                    ),
                    SizedBox(
                      height: getHeight(6),
                      width: getWidth(12),
                      child: OutlinedButton(
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.white),
                          foregroundColor: WidgetStatePropertyAll(Colors.black),
                          shadowColor: WidgetStatePropertyAll(Colors.black),
                          // overlayColor: WidgetStatePropertyAll(),
                          // surfaceTintColor:
                          //     WidgetStatePropertyAll(Colors.black),
                        ),
                        onPressed: () {
                          controller.resultSell = 0.0;
                          controller.deleteShared();
                          controller.deleteAllAccount();
                        },
                        child: const Text("Delete All Items "),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}

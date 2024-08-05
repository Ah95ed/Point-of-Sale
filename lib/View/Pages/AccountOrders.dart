import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/View/Widget/CardAccount.dart';
import '../../Control/AccountController.dart';
import 'dart:async';

// ignore: must_be_immutable
class AccountOrders extends StatefulWidget {
  const AccountOrders({super.key});

  @override
  State<AccountOrders> createState() => _AccountOrdersState();
}

class _AccountOrdersState extends State<AccountOrders> {
  // AccountController con = Get.find();
  double _height = 0.0;
  // SharedPreferences? _prefs;


  @override
  Widget build(BuildContext context) {
    // con.getDataFromAccount();
    _height = MediaQuery.of(context).size.height;
    return GetBuilder<AccountController>(
        init: AccountController(),
        builder: (controller) {
          return Scaffold(
            
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextFormField(
                    controller: controller.controller,
                    onChanged: (value) {
                      controller.searchCodeOrder(value);
                    },
                    style: const TextStyle(
                      color: Colors.white,
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
                  height: _height - 170,
                  child: const CardAccount(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Result : ${controller.resultSell} ',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        controller.resultSell = 0.0;
                        controller.deleteShared();
                        controller.deleteAllAccount();
                      },
                      child: const Text("Delete All Items "),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                )
              ],
            ),
          );
        });
  }
}

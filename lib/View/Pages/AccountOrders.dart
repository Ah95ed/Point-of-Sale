import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Helper/Log/Logger.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/style/SizeApp/SizeApp.dart';
import 'package:point_of_sell/View/Widget/AllItems.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';
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
        return SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                controller: controller.controller,
                onChanged: (value) {
                  if (value.isEmpty) return;
                  controller.searchCodeOrder(value);
                },
          
                style: const TextStyle(
                  color: Colors.black,
                ),
                // controller: text,
                decoration: InputDecoration(
                  labelText: 'name',
                  suffixIcon: context.isMobile
                      ? IconButton(
                          onPressed: () {
                            final qrBarCodeScannerDialogPlugin =
                                QrBarCodeScannerDialog();
                            qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
                              context: context,
                              onCode: (code) {},
                            );
                          },
                          icon: const Icon(
                            Icons.barcode_reader,
                            color: Colors.black,
                          ),
                        )
                      : null,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: context.isMobile
                    ? context.getHeight(69) -
                        context.getAppBarHeightWithStatusBar()
                    : context.getHeight(72),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: context.isMobile ? 2 : 4,
                    ),
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
                    }),
              ),
              Container(
                color: ColorUsed.lightBlue,
                height: context.getHeight(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Result : ${controller.resultSell} ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: context.getFontSize(6),
                      ),
                    ),
                    SizedBox(
                      height: context.getHeight(6),
                      width: context.getWidth(28),
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
                        child: Text(
                          'Delete All',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: context.getFontSize(5),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

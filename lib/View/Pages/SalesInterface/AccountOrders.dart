import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/AccountController.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Widget/AllItems.dart';
import 'package:point_of_sell/View/style/SizeApp/DeviceUtils.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

// ignore: must_be_immutable
class AccountOrders extends StatefulWidget {
  const AccountOrders({super.key});

  @override
  State<AccountOrders> createState() => _AccountOrdersState();
}

class _AccountOrdersState extends State<AccountOrders> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
      builder: (controller) {
        return SizedBox(
          height:  context.screenWidth,
          width:context.screenHeight,
          
          child: Column(
            children: [
              SizedBox(
                height: context.getHeight(25),
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
                  decoration: InputDecoration(
                    labelText: 'name',
                    suffixIcon: DeviceUtils.isMobile(context)
                        ? IconButton(
                            onPressed: () {
                              final qrBarCodeScannerDialogPlugin =
                                  QrBarCodeScannerDialog();
                              qrBarCodeScannerDialogPlugin
                                  .getScannedQrBarCode(
                                context: context,
                                onCode: (code) {
                                  controller.searchCodeOrder(code!);
                                },
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
              ),
              Expanded(
                child: Container(
                  color: ColorUsed.whitesoft,
                  height: context.getHeight(350),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: DeviceUtils.isMobile(context) ? 1 : 4,
                        childAspectRatio: DeviceUtils.isMobile(context) ? 4 : 1.5,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                      ),
                      itemCount: controller.search.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AllItems(
                          () async {
                            if (controller.search.isEmpty) return;
                            await controller.deleteItem(
                              controller.search[index].id,
                              controller.search[index].sale,
                            );
                            controller.getDataFromAccount();
                          },
                          name: controller.search[index].name,
                          sale: controller.search[index].sale,
                        );
                      },
                      ),
                ),
              ),
              
              Container(
                color: ColorUsed.whiteBlue,
                height: context.getHeight(40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Result : ${00} ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: context.getFontSize(12),
                      ),
                    ),
                    OutlinedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.white),
                        foregroundColor:
                            WidgetStatePropertyAll(Colors.black),
                        shadowColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      onPressed: () {
                        // controller.resultSell = 0.0;
                        // controller.deleteShared();
                        // controller.deleteAllAccount();
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

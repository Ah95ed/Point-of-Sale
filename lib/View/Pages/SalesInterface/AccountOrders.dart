import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/AccountController.dart';
import 'package:point_of_sell/Helper/Log/LogApp.dart';
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
      init: AccountController(),
      builder: (controller) {
        return Column(
          children: [
            SizedBox(
              height: context.getHeight(22),
              child: TextFormField(
                   onChanged: (value) {
                      if (value.isEmpty) return;
                      logWarning('message  $value');
                      controller.searchCodeOrder(value);
                    },
                // readOnly: true,
                controller: controller.controller,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Search'.tr,
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: context.getFontSize(10),
                  ),
                 
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
                 
                  )
                ),
            ),
            
           Expanded(
              child: Container(
                color: ColorUsed.whitesoft,
                // height: context.getHeight(350),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: DeviceUtils.isMobile(context) ? 1 : 4,
                      childAspectRatio:4,
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
              height: context.getHeight(35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Result : ${controller.resultSell} ',
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
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

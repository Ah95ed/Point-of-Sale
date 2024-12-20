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
      init: AccountController(),
      builder: (controller) {
        return Column(
          children: [
            Expanded(
              child: TextFormField(
                readOnly: true,
                controller: controller.text,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: ()  {
                      
                    },
                    icon: const Icon(
                      Icons.qr_code_scanner,
                      color: Colors.white,
                    )
                  )
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

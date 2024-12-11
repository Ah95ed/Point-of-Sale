import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Helper/Log/Logger.dart';
import 'package:point_of_sell/Helper/Service/Service.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/style/SizeApp/SizeApp.dart';
import 'package:point_of_sell/View/Widget/AllItems.dart';
import '../../Control/AccountController.dart';

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
        return PopScope(
          canPop: true,
          // ignore: deprecated_member_use
          onPopInvoked: (didPop) {
            if (didPop) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      title: Text('data'),
                    );
                  });
              sharep!.setDouble('result', controller.resultSell);
              Log.log('didpop');
              // Navigator.pop(context);
            }
          },
          child: SizedBox(
            height: context.getHeight(100),
            child: Column(
              children: [
                SizedBox(
                  height: context.getHeight(6),
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
                      suffixIcon: context.isMobile
                          ? IconButton(
                              onPressed: () {
                                // final qrBarCodeScannerDialogPlugin =
                                    // QrBarCodeScannerDialog();
                                // qrBarCodeScannerDialogPlugin
                                //     .getScannedQrBarCode(
                                //   context: context,
                                //   onCode: (code) {
                                //     controller.searchCodeOrder(code!);
                                //   },
                                // );
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
                Container(
                  color: ColorUsed.whitesoft,
                  height: context.getHeight(78),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: context.isMobile ? 1 : 4,
                        childAspectRatio: context.isMobile ? 4 : 1.5,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
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
                      }),
                ),
                Container(
                  color: ColorUsed.lightBlue,
                  height: context.getHeight(8),
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
                      Padding(
                        padding: EdgeInsets.only(bottom: context.getHeight(1)),
                        child: SizedBox(
                          height: context.getHeight(4),
                          width: context.getWidth(30),
                          child: OutlinedButton(
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
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

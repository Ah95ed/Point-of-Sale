import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:point_of_sell/Control/AccountController.dart';
import 'package:point_of_sell/Helper/Locale/Language.dart';
import 'package:point_of_sell/Helper/Log/LogApp.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Widget/AllItems.dart';
import 'package:point_of_sell/View/Widget/TextField.dart';
import 'package:point_of_sell/View/style/SizeApp/DeviceUtils.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';
import 'package:point_of_sell/View/style/SizeApp/SizeBuilder.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class AccountOrders extends StatefulWidget {
  const AccountOrders({super.key});

  @override
  State<AccountOrders> createState() => _AccountOrdersState();
}

class _AccountOrdersState extends State<AccountOrders> {
  TextEditingController search = TextEditingController();
  TextEditingController acount = TextEditingController();
  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  String selectedValue = "احمد";
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
      init: AccountController(),
      builder: (controller) {
        controller.getNameCustomer();
        return Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(context.getMinSize(8)),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      spacing: context.getHeight(1),
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: search,
                            decoration: const InputDecoration(
                              labelText: 'بحث',
                              prefixIcon: Icon(Icons.search),
                            ),
                          ),
                        ),

                        Expanded(
                          child: DropdownButton<String>(
                            hint: const Text("اختر خيارًا"),
                            value: selectedValue,
                            items:
                                controller.items.map((String item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue = newValue!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                    Row(
                      spacing: context.getHeight(10),
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'التاريخ',
                              prefixIcon: Icon(Icons.date_range),
                            ),
                          ),
                        ),

                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'رقم الفاتورة',
                              prefixIcon: Icon(Icons.receipt_long),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      spacing: context.getHeight(10),
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'المستودع',
                              prefixIcon: Icon(Icons.warehouse),
                            ),
                          ),
                        ),

                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'نوع السعر',
                              prefixIcon: Icon(Icons.attach_money),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: context.getHeight(34),
              child: Padding(
                padding: EdgeInsets.all(context.getMinSize(4)),
                child: TextFormField(
                  onChanged: (value) {
                    if (value.isEmpty) return;
                    logWarning('message  $value');
                    controller.searchCodeOrder(value);
                  },
                  // readOnly: true,
                  controller: search,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Search'.tr,
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: context.getFontSize(12),
                    ),
                    suffixIcon:
                        DeviceUtils.isMobile(context)
                            ? IconButton(
                              onPressed: () async {
                                final perm = await Permission.camera.request();
                                if (await perm.isGranted) {
                                  showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        content: SizedBox(
                                          width: context.screenWidth,
                                          height: context.screenHeight / 2,
                                          child: SimpleBarcodeScanner(
                                            scaleHeight: context.screenHeight,
                                            scaleWidth:
                                                context.screenHeight / 1.2,
                                            onScanned: (code) {
                                              setState(() {
                                                // result = code;
                                              });
                                            },
                                            continuous: true,
                                            onBarcodeViewCreated: (
                                              BarcodeViewController c,
                                            ) {
                                              // this.controller = controller;
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                              },
                              icon: const Icon(
                                Icons.qr_code_scanner_rounded,
                                color: Colors.black,
                              ),
                            )
                            : null,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: ColorUsed.whitesoft,
                // height: context.getHeight(350),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: DeviceUtils.isMobile(context) ? 1 : 3,
                    childAspectRatio: context.getMinSize(1.6),
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                  ),
                  itemCount: controller.search.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizeBuilder(
                      baseSize: const Size(250, 300),
                      height: context.getHeight(300),
                      width: context.getWidth(200),
                      child: Builder(
                        builder: (context) {
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
                    );
                  },
                ),
              ),
            ),
            Container(
              color: ColorUsed.whiteBlue,
              height: context.getHeight(38),
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

                  ElevatedButton.icon(
                    onPressed: () {
                      controller.resultSell = 0.0;
                      controller.deleteShared();
                      controller.deleteAllAccount();
                    },
                    icon: const Icon(Icons.delete),
                    label: Text(Language.delete.tr),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.save),
                    label: Text(Language.save.tr),
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

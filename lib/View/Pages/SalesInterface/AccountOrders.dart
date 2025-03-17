import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
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
  TextEditingController number = TextEditingController();
  TextEditingController title = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    search.dispose();
    acount.dispose();
    number.dispose();
    title.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
      init: AccountController(),
      builder: (controller) {
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
                      spacing: context.getHeight(10),
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: acount,
                            decoration: const InputDecoration(
                              labelText: 'الحساب',
                              prefixIcon: Icon(Icons.account_balance),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: title,
                            decoration: const InputDecoration(
                              labelText: 'العنوان',
                              prefixIcon: Icon(Icons.person),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Autocomplete<Map<String, dynamic>>(
                            // تحويل الخريطة إلى نص للعرض داخل القائمة
                            displayStringForOption:
                                (Map<String, dynamic> option) =>
                                    option["Name"] ?? "",
                            optionsBuilder: (
                              TextEditingValue textEditingValue,
                            ) {
                              if (textEditingValue.text.isEmpty) {
                                return const Iterable<
                                  Map<String, dynamic>
                                >.empty();
                              }
                              logError("message ${controller.items}");
                              // فلترة القائمة بناءً على قيمة المفتاح "name"
                              return controller.items
                                  .whereType<Map<String, dynamic>>()
                                  .where((Map<String, dynamic> option) {
                                    String optionText =
                                        option["Name"].toString();
                                    logInfo("message $optionText");
                                    return optionText.toLowerCase().contains(
                                      textEditingValue.text.toLowerCase(),
                                    );
                                  });
                            },
                            fieldViewBuilder: (
                              BuildContext context,
                              TextEditingController textEditingController,
                              FocusNode focusNode,
                              VoidCallback onFieldSubmitted,
                            ) {
                              return TextField(
                                controller: textEditingController,
                                focusNode: focusNode,
                                decoration: const InputDecoration(
                                  hintText:
                                      'أدخل الاسم هنا', // التلميح داخل حقل النص
                                ),
                              );
                            },
                            onSelected: (Map<String, dynamic> selection) {
                              number.text = selection["Phone"].toString();
                              title.text = selection["Address"].toString();
                              setState(() {});
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
                            controller: number,
                            decoration: const InputDecoration(
                              labelText: 'الهاتف',
                              prefixIcon: Icon(Icons.phone),
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
                                                search.text = code;
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
                color: Colors.white38,
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
                  ElevatedButton.icon(
                    onPressed: () {
                      //print
                    },
                    icon: const Icon(Icons.print,color: Colors.black54,),
                    label: const Text(
                      'طباعة',
                      style: TextStyle(color: Colors.black54),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

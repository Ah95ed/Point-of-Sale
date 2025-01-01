import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:point_of_sell/Control/HomeController.dart';
import 'package:point_of_sell/Helper/Locale/Language.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/DataBaseSqflite.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Widget/Mobile.dart';
import 'package:point_of_sell/View/Widget/SelectDate.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/CustomMaterialButton.dart';
import 'package:point_of_sell/View/Widget/TextField.dart';
import 'package:point_of_sell/View/style/SizeApp/DeviceUtils.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';
import 'package:point_of_sell/View/style/SizeApp/SizeBuilder.dart';
import 'package:simple_barcode_scanner/barcode_appbar.dart';
import 'package:simple_barcode_scanner/enum.dart';
import 'package:simple_barcode_scanner/screens/io_device.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
// import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

class AddItems extends StatefulWidget {
  const AddItems({super.key});

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // drawer: DeviceUtils.isMobile(context) ? const DrawerAllApp() : null,
      appBar: DeviceUtils.isMobile(context)
          ? null
          : AppBar(
              title: Text(Language.AddItems.tr),
              centerTitle: true,
            ),
      resizeToAvoidBottomInset: true,
      body: const SingleChildScrollView(
        clipBehavior: Clip.none,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
        child: AddItemBody(),
      ),
      // body: AddItems(name: name, code: code, sale: sale, buy: buy, quantity: quantity, company: company, date: date),
    );
  }
}

class AddItemBody extends StatefulWidget {
  const AddItemBody({
    super.key,
  });

  @override
  State<AddItemBody> createState() => _AddItemBodyState();
}

class _AddItemBodyState extends State<AddItemBody> {
  TextEditingController name = TextEditingController();

  TextEditingController code = TextEditingController();

  TextEditingController sale = TextEditingController();

  TextEditingController buy = TextEditingController();

  TextEditingController quantity = TextEditingController();

  // Company
  TextEditingController company = TextEditingController();

  TextEditingController date = TextEditingController(
    text: (DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now()).toString()),
  );

  @override
  void dispose() {
    name.dispose();
    code.dispose();
    sale.dispose();
    buy.dispose();
    quantity.dispose();
    company.dispose();
    date.dispose();
    super.dispose();
  }

// String? res =  SimpleBarcodeScanner.scanBarcode(
//                   context,
//                   barcodeAppBar: const BarcodeAppBar(
//                     appBarTitle: 'Test',
//                     centerTitle: false,
//                     enableBackButton: true,
//                     backButtonIcon: Icon(Icons.arrow_back_ios),
//                   ),
//                   isShowFlashIcon: true,
//                   delayMillis: 2000,
//                   cameraFace: CameraFace.front,
//                 );
//                 setState(() {
//                   result = res as String;
//                 });
  String? result;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return SizedBox(
          height: context.screenHeight,
          child: Column(
            children: [
              TextFieldCustom(
                name: 'itemName'.tr,
                icons: Icons.shape_line,
                text: name,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: code,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorUsed.appBarColor,
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: ColorUsed.appBarColor,
                    ),
                    labelText: 'code'.tr,
                    suffixIcon: DeviceUtils.isMobile(context)
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
                                          scaleWidth: context.screenHeight / 1.2,
                                          onScanned: (code) {
                                            setState(() {
                                              this.code.text = code;
                                            });
                                          },
                                          continuous: true,
                                          onBarcodeViewCreated:
                                              (BarcodeViewController
                                                  controller) {
                                            // this.controller = controller;
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                            icon: const Icon(Icons.qr_code_scanner_rounded),
                          )
                        : null,
                    prefixIcon: const Icon(Icons.barcode_reader),
                  ),
                ),
              ),
              TextFieldCustom(
                name: "sale".tr,
                icons: Icons.price_change,
                text: sale,
              ),
              TextFieldCustom(
                name: "buy".tr,
                icons: Icons.description,
                text: buy,
              ),
              TextFieldCustom(
                name: 'quantity'.tr,
                icons: Icons.description,
                text: quantity,
              ),
              TextFieldCustom(
                name: 'company_name'.tr,
                icons: Icons.store_sharp,
                text: company,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFieldCustom(
                      name: "date".tr,
                      icons: Icons.date_range,
                      text: date,
                    ),
                  ),
                  Expanded(flex: 1, child: SelectDate(dateCtrl: date)),
                ],
              ),
              CustomMaterialButton(
                title: 'Add'.tr,
                onPressed: () async {
                  await controller.addItems(
                    {
                      DataBaseSqflite.name: name.text,
                      DataBaseSqflite.codeItem: code.text,
                      DataBaseSqflite.sale: sale.text,
                      DataBaseSqflite.buy: buy.text,
                      DataBaseSqflite.quantity: quantity.text,
                      DataBaseSqflite.date: date.text,
                      DataBaseSqflite.company: company.text,
                    },
                  );
                  name.clear();
                  code.clear();
                  sale.clear();
                  buy.clear();
                  company.clear();
                  quantity.clear();
                  date.clear();
                },
              ),
            ],
          ),
        );
        // : SizedBox(
        //   child: Column(
        //       children: [
        //         SizedBox(
        //           child: Row(
        //             children: [
        //               Expanded(
        //                 child: TextFieldCustom(
        //                   name: 'itemName'.tr,
        //                   icons: Icons.shape_line,
        //                   text: name,
        //                 ),
        //               ),
        //               Expanded(
        //                 child: TextFieldCustom(
        //                   name: 'code'.tr,
        //                   icons: Icons.barcode_reader,
        //                   text: code,
        //                 ),
        //               ),
        //               Expanded(
        //                 child: TextFieldCustom(
        //                   name: "sale".tr,
        //                   icons: Icons.price_change,
        //                   text: sale,
        //                 ),
        //               ),
        //               Expanded(
        //                 child: TextFieldCustom(
        //                   name: "buy".tr,
        //                   icons: Icons.description,
        //                   text: buy,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //         SizedBox(
        //           child: Row(
        //             children: [
        //               Expanded(
        //                 child: TextFieldCustom(
        //                   name: 'quantity'.tr,
        //                   icons: Icons.description,
        //                   text: quantity,
        //                 ),
        //               ),
        //               Expanded(
        //                 child: TextFieldCustom(
        //                   name: 'company_name'.tr,
        //                   icons: Icons.store_sharp,
        //                   text: company,
        //                 ),
        //               ),
        //               Expanded(
        //                 child: Row(
        //                   children: [
        //                     Expanded(
        //                       child: TextFieldCustom(
        //                         name: "date".tr,
        //                         icons: Icons.date_range,
        //                         text: date,
        //                       ),
        //                     ),
        //                     SelectDate(dateCtrl: date),
        //                   ],
        //                 ),
        //               ),
        //               CustomMaterialButton(
        //                 title: 'Add'.tr,
        //                 onPressed: () {
        //                   controller.addItems(
        //                     {
        //                       DataBaseSqflite.name: name.text,
        //                       DataBaseSqflite.codeItem: code.text,
        //                       DataBaseSqflite.sale: sale.text,
        //                       DataBaseSqflite.buy: buy.text,
        //                       DataBaseSqflite.quantity: quantity.text,
        //                       DataBaseSqflite.date: date.text,
        //                       DataBaseSqflite.company: company.text,
        //                     },
        //                   );
        //                   name.clear();
        //                   code.clear();
        //                   sale.clear();
        //                   buy.clear();
        //                   company.clear();
        //                   quantity.clear();
        //                   date.clear();

        //                   // controller.update();
        //                 },
        //               ),
        //             ],
        //           ),
        //         ),
        //         Expanded(
        //           flex: 3,
        //           child: CardTableStorage(),
        //         ),
        //         // const Expanded(
        //         //   flex: 2,
        //         //   child: TabsOnStorage(),
        //         // ),
        //       ],
        //     ),
        // );
      },
    );
  }
}

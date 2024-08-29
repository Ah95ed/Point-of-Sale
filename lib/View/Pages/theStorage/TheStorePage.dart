import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/HomeController.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/DataBaseSqflite.dart';
import 'package:point_of_sell/View/Widget/SelectDate.dart';
import 'package:intl/intl.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/CustomMaterialButton.dart';
import 'package:point_of_sell/View/Widget/storgeWidget/TableStoragr.dart';
import 'package:point_of_sell/View/Widget/storgeWidget/TabsOnStorage.dart';
import '../../Widget/TextField.dart';

class TheStorePage extends StatelessWidget {
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
  TheStorePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFieldCustom(
                      name: 'itemName'.tr,
                      icons: Icons.shape_line,
                      text: name,
                    ),
                  ),
                  Expanded(
                    child: TextFieldCustom(
                      name: 'code'.tr,
                      icons: Icons.barcode_reader,
                      text: code,
                    ),
                  ),
                  Expanded(
                    child: TextFieldCustom(
                      name: "sale".tr,
                      icons: Icons.price_change,
                      text: sale,
                    ),
                  ),
                  Expanded(
                    child: TextFieldCustom(
                      name: "buy".tr,
                      icons: Icons.description,
                      text: buy,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFieldCustom(
                      name: 'quantity'.tr,
                      icons: Icons.description,
                      text: quantity,
                    ),
                  ),
                  Expanded(
                    child: TextFieldCustom(
                      name: 'company_name'.tr,
                      icons: Icons.store_sharp,
                      text: company,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFieldCustom(
                            name: "date".tr,
                            icons: Icons.date_range,
                            text: date,
                          ),
                        ),
                        SelectDate(dateCtrl: date),
                      ],
                    ),
                  ),
                  CustomMaterialButton(
                    title: 'Adders'.tr,
                    onPressed: () {
                      controller.addItems(
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
                      
                      // controller.update();
                    },
                  ),
                ],
              ),
              Expanded(
                flex: 3,
                child: CardTableStorage(),
              ),
              const Expanded(
                flex: 2,
                child: TabsOnStorage(),
              ),
            ],
          );
        },
      ),
    );
  }
}



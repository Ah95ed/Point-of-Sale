import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/View/Widget/TextField.dart';
import '../../../Control/HomeController.dart';
import '../../../Model/Models/DataBaseApp/DataBaseSqflite.dart';
import '../../Colors/Colors.dart';

class UpdateData extends StatefulWidget {
  String named, coded, saled, buyt, quan, id, dated,company;

  UpdateData({
    super.key,
    required this.named,
    required this.coded,
    required this.saled,
    required this.buyt,
    required this.quan,
    required this.id,
    required this.dated,
    required this.company,
  });

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  late DataBaseSqflite data;

  TextEditingController name = TextEditingController();

  TextEditingController code = TextEditingController();

  TextEditingController sale = TextEditingController();

  TextEditingController buy = TextEditingController();

  TextEditingController quantity = TextEditingController();
TextEditingController company = TextEditingController();
  TextEditingController date = TextEditingController();
  @override
  void initState() {
    super.initState();
          name.text = widget.named;
        code.text = widget.coded;
        sale.text = widget.saled;
        buy.text = widget.buyt;
        quantity.text = widget.quan;
        date.text = widget.dated;
        company.text = widget.company;
  }
  @override
  void dispose() {
    super.dispose();
    name.dispose();
    code.dispose();
    sale.dispose();
    buy.dispose();
    quantity.dispose();
    date.dispose();
    company.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
  
        return Scaffold(
          appBar: AppBar(
            title: const Text('Update Data'),
            backgroundColor: ColorUsed.appBarColor,
            leading: IconButton(
              onPressed: () {
                controller.update();
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(children: [
                const SizedBox(
                  height: 16,
                ),
                TextFieldCustom(
                  name: 'itemName'.tr,
                  icons: Icons.person,
                  text: name,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFieldCustom(
                  name: 'code'.tr,
                  icons: Icons.barcode_reader,
                  text: code,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFieldCustom(
                  name: 'sale'.tr,
                  icons: Icons.price_change,
                  text: sale,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFieldCustom(
                  name: 'buy'.tr,
                  icons: Icons.description,
                  text: buy,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFieldCustom(
                  name: 'quantity'.tr,
                  icons: Icons.description,
                  text: quantity,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFieldCustom(
                  name: 'company',
                  icons: Icons.description,
                  text: company,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFieldCustom(
                  name: 'date'.tr,
                  icons: Icons.date_range,
                  text: date,
                ),
                const SizedBox(
                  height: 22,
                ),
                OutlinedButton(
                  onPressed: () async {
                   await controller.updateData({
                      DataBaseSqflite.name: name.text,
                      DataBaseSqflite.codeItem: code.text,
                      DataBaseSqflite.sale: sale.text,
                      DataBaseSqflite.buy: buy.text,
                      DataBaseSqflite.quantity: quantity.text,
                      DataBaseSqflite.date: date.text,
                    }, widget.id);
                    widget.named = "";
                    widget.coded = "";
                   widget. buyt = "";
                    widget.saled = "";
                    widget.quan ="";
                    widget.dated = "";
                    widget.id = "";

                    name.clear();
                    code.clear();
                    sale.clear();
                    buy.clear();
                    quantity.clear();
                    date.clear();
                  },
                  child: Text(
                    'Update_Data'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorUsed.appBarColor,
                      fontSize: 14,
                    ),
                  ),
                )
              ]),
            ),
          ),
        );
      },
    );
  }
}

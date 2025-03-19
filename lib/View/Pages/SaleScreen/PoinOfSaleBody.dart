import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/PointSale/PointSaleController.dart';
import 'package:point_of_sell/Helper/Locale/Language.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/TableNameColumnTitle.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/list_generate.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';
import 'package:point_of_sell/View/style/SizeApp/SizeBuilder.dart';

class PointOfSaleBody extends StatefulWidget {
  PointOfSaleBody({super.key});

  @override
  State<PointOfSaleBody> createState() => _PointOfSaleBodyState();
}

class _PointOfSaleBodyState extends State<PointOfSaleBody> {
  TextEditingController text = TextEditingController();
  final s = Get.put(PointSaleController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    text.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PointSaleController>(
      init: PointSaleController(),
      builder: (controller) {
        return Scaffold(
          body: Column(
            verticalDirection: VerticalDirection.down,
            spacing: context.getHeight(8),
            children: [
              SizedBox(
                height: context.getHeight(30),
                child: TextFormField(
                  controller: text,
                  onChanged: (value) {
                    controller.searchCodeOrder(value);
                  },

                  decoration: InputDecoration(
                    labelText: "Search",
                    prefixIcon: Icon(
                      Icons.search,
                      color: ColorUsed.appBarColor,
                    ),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorUsed.appBarColor),
                    ),
                    labelStyle: TextStyle(color: ColorUsed.appBarColor),
                  ),
                ),
              ),
              Container(
                width: context.screenHeight,
                height: context.screenWidth /1.5,
                color: ColorUsed.whitesoft,
                child: Table(
                  border: TableBorder.all(color: Colors.black, width: 1.0),
                  columnWidths: {
                    0: FixedColumnWidth(
                      context.screenWidth * 0.02,
                    ), // Width of the first column
                    1: FixedColumnWidth(
                      context.screenWidth * 0.3,
                    ), // Width of the second column
                    2: FixedColumnWidth(context.screenWidth * 0.1),
                    3: FixedColumnWidth(context.screenWidth * 0.1),
                    4: FixedColumnWidth(context.screenWidth * 0.06),
                    5: FixedColumnWidth(context.screenWidth * 0.1),
                    6: FixedColumnWidth(
                      context.screenWidth * 0.06,
                    ), // Width of the third column
                  },
                  children: [
                    TableRow(
                      children: [
                        TableNameColumn(name: 't'),
                        TableNameColumn(name: 'name'),
                        TableNameColumn(name: 'BarCode'),
                        TableNameColumn(name: 'singleprice'),
                        TableNameColumn(name: 'count'),
                        TableNameColumn(name: 'allprice'),
                        TableNameColumn(name: 'delete'),
                      ],
                    ),
                    ...ListViewGenerateInTable(controller.search),
                  ],
                ),
              ),

              Expanded(
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
                      onPressed: () {},
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
                      icon: const Icon(Icons.print, color: Colors.black54),
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

              // Expanded(
              //   child: Row(
              //     spacing: 4,
              //     mainAxisAlignment: MainAxisAlignment.center,

              //     children: [
              //       // TextCustom(text: controller.resultSell.toString()),
              //       SizedBox(width: context.getWidth(1)),

              //     ElevatedButton.icon(
              //       onPressed: () {

              //       },
              //       icon: const Icon(Icons.delete),
              //       label: Text(Language.delete.tr),
              //       style: ElevatedButton.styleFrom(
              //         backgroundColor: Colors.red,
              //         foregroundColor: Colors.white,
              //       ),
              //     ),
              //       SizedBox(width: context.getWidth(1)),
              //       CustomMaterialButton(title: 'New Menu', onPressed: () {}),
              //     ],
              //   ),
              // ),

              //! here complete List viwe
            ],
          ),
        );
      },
    );
  }
}

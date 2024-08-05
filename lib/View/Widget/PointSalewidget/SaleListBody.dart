import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/CustomMaterialButton.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/TableNameColumnTitle.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/TextCustom.dart';
import 'package:point_of_sell/View/Widget/PointSalewidget/textFieldDropdown.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/list_generate.dart';

class SaleListBody extends StatelessWidget {
  SaleListBody({super.key});
  final width = Get.width;
  final height = Get.height;
  // final statusbarpage = Get.;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          children: [
            // 0.1
            SizedBox(
              height: height * 0.1,
              width: width,
              child: const Row(
                children: [
                  Expanded(
                    child: TextFieldDropdown(),
                  ),
                  Expanded(
                    child: TextFieldDropdown(),
                  ),
                  Expanded(
                    child: TextFieldDropdown(),
                  ),
                ],
              ),
            ),
            // 0.5
            Container(
              color: Colors.white,
              height: height * 0.6,
              width: width,
              child: Table(
                border: TableBorder.all(color: ColorUsed.blueDark, width: 1.0),
                columnWidths: {
                  0: FixedColumnWidth(width * 0.02), // Width of the first column
                  1: FixedColumnWidth(width * 0.3), // Width of the second column
                  2: FixedColumnWidth(width * 0.1),
                  3: FixedColumnWidth(width * 0.1),
                  4: FixedColumnWidth(width * 0.06),
                  5: FixedColumnWidth(width * 0.1),
                  6: FixedColumnWidth(width * 0.06), // Width of the third column
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
                  ...ListViewGenerateInTable(['data', 'SaleList'])
                ],
              ),
            ),
      
            Container(
              color: ColorUsed.lightBlue,
              height: height * 0.24,
              width: width,
              child: Column(
                children: [
                  Row(
                    children: [
                      TextCustom(
                        text: " totalprice".tr,
                        width: width * 0.20,
                      ),
                      TextCustom(
                        text: " totalprice".tr,
                        width: width * 0.20,
                      ),
                      TextCustom(
                        text: " totalprice".tr,
                        width: width * 0.20,
                      ),
                      TextCustom(
                        text: " totalprice".tr,
                        width: width * 0.20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: width * 0.001,
                  ),
                  Row(
                    children: [
                      CustomMaterialButton(
                        title: 'PrintList',
                        onPressed: () {},
                      ),
                      CustomMaterialButton(
                        title: 'PrintList',
                        onPressed: () {},
                      ),
                      CustomMaterialButton(
                        title: 'PrintList',
                        onPressed: () {},
                      ),
                      CustomMaterialButton(
                        title: 'PrintList',
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
            //! here complete List viwe
          ],
        ),
      ),
    );
  }
}

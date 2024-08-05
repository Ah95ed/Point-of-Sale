import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/CustomMaterialButton.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/TableNameColumnTitle.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/list_generate.dart';
import 'package:point_of_sell/View/Widget/TextField.dart';
import 'package:point_of_sell/View/Widget/PointSalewidget/textFieldDropdown.dart';
import 'package:sizer/sizer.dart';

class PurchaselistBody extends StatelessWidget {
  PurchaselistBody({super.key});
  double hi = 0;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    hi = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: hi / 10,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFieldCustom(
                    name: "name".tr,
                    icons: Icons.person,
                    text: TextEditingController(),
                  ),
                ),
                const Expanded(
                  child: TextFieldDropdown(),
                ),
                const Expanded(
                  child: TextFieldDropdown(),
                ),
                const Expanded(
                  child: TextFieldDropdown(),
                ),
              ],
            ),
          ),

          Container(
            color: ColorUsed.whitesoft,
            height: hi * 0.69,
            width: MediaQuery.sizeOf(context).width,
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
                    const Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Icon(
                        Icons.delete,
                      ),
                    ),
                    // TableNameColumn(name: 'delete'),
                  ],
                ),
                ...ListViewGenerateInTable(['ahmed ', 'ali']),
              ],
            ),
          ),
          Container(
            height: hi / 6,
            color: ColorUsed.lightBlue,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 8.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      color: ColorUsed.whitesoft,
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(2),
                        top: Radius.circular(2),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '${'total summation'.tr} ${200}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  CustomMaterialButton(
                    title: 'Print',
                    onPressed: () {},
                  ),
                  CustomMaterialButton(
                    title: 'new Menu',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          //! here complete List view
        ],
      ),
    );
  }
}

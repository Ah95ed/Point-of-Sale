import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/style/SizeApp/SizeApp.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/CustomMaterialButton.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/TableNameColumnTitle.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/list_generate.dart';
import 'package:point_of_sell/View/Widget/TextField.dart';
import 'package:point_of_sell/View/Widget/PointSalewidget/textFieldDropdown.dart';

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
            height: getHeight(10),
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
            height: getHeight(60),
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
            height: getHeight(25),
            width: getWidth(100),
            color: ColorUsed.lightBlue,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getHeight(8), horizontal: getWidth(5),),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: getHeight(10),
                      width: getWidth(20),
                      decoration: BoxDecoration(
                        color: ColorUsed.whitesoft,
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(2),
                          top: Radius.circular(2),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '${'tota somation'.tr} 2000',
                          style: TextStyle(
                            fontSize: getFontSize(4),
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getWidth(1),
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

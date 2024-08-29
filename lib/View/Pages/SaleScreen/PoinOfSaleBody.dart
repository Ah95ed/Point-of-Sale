import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/style/SizeApp/SizeApp.dart';
import 'package:point_of_sell/View/Widget/PointSalewidget/pointSaletableBody.dart';
import 'package:point_of_sell/View/Widget/PointSalewidget/textFieldDropdown.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/CustomMaterialButton.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/TextCustom.dart';

class PointOfSaleBody extends StatelessWidget {
  PointOfSaleBody({super.key});
  double hi = 0;

  @override
  Widget build(BuildContext context) {
    hi = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: hi / 10,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

          Container(
            width: Get.width,
            height: hi * 0.6,
            color: ColorUsed.whitesoft,
            child: const PointSaleTableBody(),
          ),
          Container(
            height: hi * 0.24,
            color: ColorUsed.lightBlue,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: getHeight(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextCustom(
                    text: 'total 100',
                  ),
                  SizedBox(
                    width: getWidth(1),
                  ),
                  CustomMaterialButton(
                    title: 'print',
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: getWidth(1),
                  ),
                  CustomMaterialButton(
                    title: 'New Menu',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          )
          //! here complete List viwe
        ],
      ),
    );
  }
}

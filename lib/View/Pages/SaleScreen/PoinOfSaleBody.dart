import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Widget/TextField.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';
import 'package:point_of_sell/View/Widget/PointSalewidget/pointSaletableBody.dart';
import 'package:point_of_sell/View/Widget/PointSalewidget/textFieldDropdown.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/CustomMaterialButton.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/TextCustom.dart';

class PointOfSaleBody extends StatelessWidget {
  PointOfSaleBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        verticalDirection : VerticalDirection.down,
        spacing: context.getHeight(22),
        children: [
          SizedBox(
            child: TextFieldCustom(
              name: 'Search',
              icons: Icons.search,
              text: TextEditingController(),
              input: TextInputType.text,
            ),
          ),

          Container(
            width: context.width,
            height: context.height / 2,
            color: ColorUsed.whitesoft,
            child: const PointSaleTableBody(),
          ),
          Container(
            width: context.width,
            height: context.getHeight(80),
            color: ColorUsed.lightBlue,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: context.getHeight(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextCustom(text: 'total 100'),
                  SizedBox(width: context.getWidth(1)),
                  CustomMaterialButton(title: 'print', onPressed: () {}),
                  SizedBox(width: context.getWidth(1)),
                  CustomMaterialButton(title: 'New Menu', onPressed: () {}),
                ],
              ),
            ),
          ),
          //! here complete List viwe
        ],
      ),
    );
  }
}

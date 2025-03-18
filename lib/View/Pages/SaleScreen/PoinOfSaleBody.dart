import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/AccountController.dart';
import 'package:point_of_sell/Helper/Log/LogApp.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/TableNameColumnTitle.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/list_generate.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';
import 'package:point_of_sell/View/Widget/PointSalewidget/pointSaletableBody.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/CustomMaterialButton.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/TextCustom.dart';
import 'package:point_of_sell/View/style/SizeApp/SizeBuilder.dart';

class PointOfSaleBody extends StatefulWidget {
  PointOfSaleBody({super.key});

  @override
  State<PointOfSaleBody> createState() => _PointOfSaleBodyState();
}

class _PointOfSaleBodyState extends State<PointOfSaleBody> {
  TextEditingController text = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    text.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
      init: AccountController(),
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

              SizeBuilder(
                baseSize: const Size(450, 720),
                height: context.screenWidth * 2.5,
                width: context.screenHeight,

                child: Builder(
                  builder: (context) {
                    
                    return Container(
                      width: context.getWidth(500),
                      height: context.getHeight(200),
                      color: ColorUsed.whitesoft,
                      child: Container(
                        color: Colors.white,
                        height: context.screenHeight * 0.6,
                        child: Table(
                          
                          border: TableBorder.all(
                            color: Colors.black,
                            width: 1.0,
                          ),
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
                    );
                  },
                ),
              ),
              SizeBuilder(
                baseSize: const Size(450, 720),
                height: context.screenHeight ,
                width: context.screenWidth,
                child: Builder(
                  builder: (context) {
                    return Container(
                           
                     
                      color: ColorUsed.lightBlue,
                      child: Row(
                        spacing: 4,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextCustom(text: 'total 100'),
                          SizedBox(width: context.getWidth(1)),
                          CustomMaterialButton(title: 'print', onPressed: () {}),
                          SizedBox(width: context.getWidth(1)),
                          CustomMaterialButton(title: 'New Menu', onPressed: () {}),
                        ],
                      ),
                    );
                  }
                ),
              ),
              //! here complete List viwe
            ],
          ),
        );
      },
    );
  }
}

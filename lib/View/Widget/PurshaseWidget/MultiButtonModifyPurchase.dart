




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/CustomMaterialButton.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/TextCustom.dart';

class MultiButtonModifyPushae extends StatelessWidget {
  const MultiButtonModifyPushae({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUsed.lightBlue,
      height: height * 0.24,
      width: width,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(height: width * 0.06,),
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
    );
  }
}






import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/HomeController.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/TextCustom.dart';
import 'package:sizer/sizer.dart';

class CardShowData extends StatelessWidget {
  CardShowData({this.index, super.key});
  int? index;
  HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [


        // ! ! Edit here to complete //
        TextCustom(
          width: 50.w,
          text: controller.items[index!].name,
        ),
        TextCustom(
          width: 20.w,
          text: "Ali",
        ),
        TextCustom(
          width: 20.w,
          text: "Ali",
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.5.w),
          child: Container(
            width: 10.w,
            height: 6.w,
            decoration: BoxDecoration(
              color: ColorUsed.whitesoft,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(4),
                top: Radius.circular(4),
              ),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                size: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
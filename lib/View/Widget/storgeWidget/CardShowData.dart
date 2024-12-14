import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/HomeController.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/TextCustom.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';

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
          width: context.getWidth(50),
          text: controller.items[index!].name,
        ),
        TextCustom(
          width: context.getWidth(20),
          text: "Ali",
        ),
        TextCustom(
          width: context.getWidth(20),
          text: "Ali",
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.getWidth(4),
            vertical: context.getHeight(2),
          ),
          child: Container(
            width: context.getWidth(10),
            height: context.getHeight(6),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/HomeController.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/SizeApp/SizeApp.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/TextCustom.dart';

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
          width: getWidth(50),
          text: controller.items[index!].name,
        ),
        TextCustom(
          width: getWidth(20),
          text: "Ali",
        ),
        TextCustom(
          width: getWidth(20),
          text: "Ali",
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getWidth(4),
            vertical: getHeight(2),
          ),
          child: Container(
            width: getWidth(10),
            height: getHeight(6),
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


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:sizer/sizer.dart';

class CustomMaterialButton extends StatelessWidget {
  String? title;

  CustomMaterialButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 1.w,vertical: 1.h),
      child: MaterialButton(
        height: Get.height * 0.08,
        minWidth: Get.width * 0.205,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: const BorderSide(
            color: Colors.black, // Border color
            width: 1.0, // Border width
          ),
        ),
        color: ColorUsed.whitesoft,
        onPressed: onPressed,
        child: Text(
          title!,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

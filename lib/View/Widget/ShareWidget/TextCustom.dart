import 'package:flutter/material.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/style/SizeApp/SizeApp.dart';

class TextCustom extends StatelessWidget {
  TextCustom({this.width, this.text,this.onSecondaryTap, super.key});
  String? text;
  double? width;
   GestureTapCallback? onSecondaryTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getWidth(1),
        vertical: getHeight(1),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: ColorUsed.whitesoft,
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(4),
            top: Radius.circular(
              4,
            ),
          ),
        ),
        child: Text(
          text!,
          style: TextStyle(
            color: Colors.black,
            fontSize: getFontSize(4),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}



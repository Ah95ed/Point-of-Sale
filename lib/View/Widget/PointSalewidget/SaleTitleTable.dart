import 'package:flutter/material.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';



class SaleTitleTable extends StatelessWidget {
  SaleTitleTable({this.title, this.width, super.key});
  String? title;
  double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUsed.blueDark,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Container(
          width: width,
          height: context.getHeight(2),
          decoration: BoxDecoration(
            color: ColorUsed.blueDark,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(4),
              top: Radius.circular(4),
            ),
          ),
          child: Center(
            child: Text(
              title!,
              style: TextStyle(
                color: ColorUsed.whitesoft,
                fontSize:context. getFontSize(6),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
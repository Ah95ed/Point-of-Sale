import 'package:flutter/material.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/style/SizeApp/SizeApp.dart';

class TitleTablesStorge extends StatelessWidget {
  TitleTablesStorge({this.width, this.title, super.key});
  final String? title;
  double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getWidth(1),
        vertical: getHeight(1),
      ),
      child: Container(
        width: width ?? getWidth(18),
        height: getHeight(4),
        decoration: BoxDecoration(
          color: ColorUsed.blueDark,
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(4),
            top: Radius.circular(
              4,
            ),
          ),
        ),
        child: Center(
          child: Text(
            title!,
            style: TextStyle(
              color: ColorUsed.whitesoft,
              fontSize: getFontSize(6),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

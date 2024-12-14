import 'package:flutter/material.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';

class TitleTablesStorge extends StatelessWidget {
  TitleTablesStorge({this.width, this.title, super.key});
  final String? title;
  double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.getWidth(1),
        vertical:context. getHeight(1),
      ),
      child: Container(
        width: width ?? context.getWidth(18),
        height: context.getHeight(4),
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
              fontSize: context.getFontSize(6),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

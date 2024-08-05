import 'package:flutter/material.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:sizer/sizer.dart';

class TitleTablesStorge extends StatelessWidget {
  TitleTablesStorge({this.width, this.title, super.key});
  final String? title;
  double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.0.w, vertical: 1.0.w),
      child: Container(
        width: width ?? 20.w,
        height: 4.w,
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
              fontSize: 6.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

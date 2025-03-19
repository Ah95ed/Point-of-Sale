
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';

class TableNameColumn extends StatelessWidget {
  TableNameColumn({super.key, required this.name});
  final String name;
  final hi = Get.height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: hi * 0.04,
      color: ColorUsed.whiteBlue,
      alignment: Alignment.center,
      child: Center(
        child: Text(
          name,
          textAlign: TextAlign.end,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}

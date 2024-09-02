
import 'package:flutter/material.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/style/SizeApp/SizeApp.dart';

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
      padding:  EdgeInsets.symmetric(horizontal:getWidth( 1),vertical: getHeight( 1)),
      child: MaterialButton(
        height: context.getHeight(6),
        minWidth:context.getWidth(2),
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
          style:  TextStyle(
            fontSize: context.getFontSize(8),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

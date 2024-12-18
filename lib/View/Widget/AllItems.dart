import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Helper/Locale/Language.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';

// ignore: must_be_immutable
class AllItems extends StatelessWidget {
  // const CardViewList({super.key});

  String name, sale;
  VoidCallback onPressed;
  AllItems(
    this.onPressed, {
    super.key,
    required this.name,
    required this.sale,
  });

  @override

  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: ColorUsed.whitesoft,
      child: Padding(
        padding:  EdgeInsets.all(context.sizeBuilder.width/30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      Language.nameItem.tr,
                      style: TextStyle(
                          fontSize: context.sizeBuilder.width/25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: context.sizeBuilder.width/25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      Language.saleItem.tr,
                      style: TextStyle(
                          fontSize:context.sizeBuilder.width/25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      sale,
                      style: TextStyle(
                          fontSize:context.sizeBuilder.width/25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.delete,
              color: const Color.fromARGB(255, 219, 15, 0),
              size: context.sizeBuilder.width/15,
            ),
                      ),
          ],
        ),
      ),
    );
  }
}

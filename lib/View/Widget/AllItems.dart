import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Helper/Locale/Language.dart';
import 'package:point_of_sell/Helper/Log/LogApp.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';
import 'package:point_of_sell/View/style/SizeApp/SizeBuilder.dart';

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
    return  Container(
          width: context.getHeight(200),
          decoration: BoxDecoration(
            color: ColorUsed.whitesoft,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black),
          ),
          child: Column(
            spacing: context.getHeight(20),
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    Language.nameItem.tr,
                    style: TextStyle(
                        fontSize: context.getFontSize(30),
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: context.getFontSize(30),
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
                        fontSize: context.getFontSize(30),
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    sale,
                    style: TextStyle(
                        fontSize: context.getFontSize(30),
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              
                IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.delete,
            color: const Color.fromARGB(255, 219, 15, 0),
            size: context.getMinSize(120),
          ),
                    ),
            ],
          ),
        );
    
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Helper/Locale/Language.dart';
import 'package:point_of_sell/View/style/SizeApp/SizeApp.dart';

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
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      Language.nameItem.tr,
                      style: TextStyle(
                          fontSize: context.getFontSize(6),
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        name,
                        style: TextStyle(
                            fontSize: context.getFontSize(6),
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      Language.saleItem.tr,
                      style: TextStyle(
                          fontSize: context.getFontSize(6),
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        sale,
                        style: TextStyle(
                            fontSize: context.getFontSize(6),
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.delete,
              color: const Color.fromARGB(255, 219, 15, 0),
              size: context.isMobile
                  ? context.getWidth(10)
                  : context.getHeight(8),
            ),
          ),
        ],
      ),
    );
  }
}

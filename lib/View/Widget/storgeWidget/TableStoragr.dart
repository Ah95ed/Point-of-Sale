import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/HomeController.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/TableNameColumnTitle.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/TextCustom.dart';

class CardTableStorage extends StatelessWidget {
  CardTableStorage({super.key});
  final width = MediaQuery.of(Get.context!).size.width;
  HomeController c = Get.find();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: width,
        color: ColorUsed.whitesoft,
        child: Table(
          border: TableBorder.all(
            color: ColorUsed.blueDark,
            width: 1.0,
          ),
          columnWidths: {
            0: FixedColumnWidth(
              width * 0.3,
            ), // Width of the first column
            1: FixedColumnWidth(
              width * 0.01,
            ), // Width of the second column
            2: FixedColumnWidth(
              width * 0.01,
            ),
            3: FixedColumnWidth(
              width * 0.01,
            ),
            // Width of the third column
          },
          children: [
            TableRow(
              children: [
                TableNameColumn(name: 'name'),
                TableNameColumn(name: 'count'),
                TableNameColumn(name: 'store'),
                TableNameColumn(name: 'delete'),
              ],
            ),
            ...List.generate(
              c.items.length,
              (i) {
                return TableRow(
                  children: [
                    TextCustom(text: c.items[i].name),
                    TextCustom(
                      text: c.items[i].quantity,
                    ),
                    TextCustom(
                      text: c.items[i].company,
                    ),
                    IconButton(
                      onPressed: () {
                        log(' $i');
                        c.deleteItem(c.items[i].id);
                        c.items.remove(i);
                        // c.paginationData();
                      },
                      icon: const Icon(
                        Icons.remove_circle_outline,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
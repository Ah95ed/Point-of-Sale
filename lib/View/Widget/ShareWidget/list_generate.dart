import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/PointSale/PointSaleController.dart';
import 'package:point_of_sell/Model/Models/Items.dart';

List<TableRow> ListViewGenerateInTable(List<Items> data) {
  return List.generate(data.length, (i) {
    return TableRow(
      children: [
        Center(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(data[i].id),
        )),
        Center(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(data[i].name),
        )),
        Center(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(data[i].code),
        )),
        Center(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(data[i].sale),
        )),
        Center(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(data[i].quantity),
        )),
        Center(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(data[i].sale),
        )),
        Center(
          child: IconButton(
            onPressed: () {
           
            final c = Get.find<PointSaleController>();
           c.deletefromId( data[i].id);
            },
            icon: const Icon(Icons.delete),
          ),
        ),
      ],
    );
  });
}

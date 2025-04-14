import 'package:flutter/material.dart';
import 'package:point_of_sell/Control/PointSale/PointSaleController.dart';
import 'package:point_of_sell/Helper/Log/LogApp.dart';

List<TableRow> ListViewGenerateInTable(PointSaleController c) {
  return List.generate(c.search.length, (i) {
    return TableRow(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(c.search[i].id),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(c.search[i].name),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(c.search[i].code),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(c.search[i].sale),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(c.search[i].quantity),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(c.search[i].sale),
          ),
        ),
        Center(
          child: IconButton(
            onPressed: () async {
              logError("message on pressed delete ${c.search[i].id}");
              await c.deletefromId(c.search[i].id).then((value) {
                   
              });
            },
            icon: const Icon(Icons.delete),
          ),
        ),
      ],
    );
  },);
}

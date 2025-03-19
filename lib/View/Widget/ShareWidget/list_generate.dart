import 'package:flutter/material.dart';
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
            onPressed: () {},
            icon: const Icon(Icons.recycling),
          ),
        ),
      ],
    );
  });
}

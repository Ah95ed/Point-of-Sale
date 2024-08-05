import 'package:flutter/material.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/TableNameColumnTitle.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/list_generate.dart';

class PointSaleTableBody extends StatelessWidget {
  const PointSaleTableBody({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      height: height * 0.6,
      child: Table(
        border: TableBorder.all(color: Colors.black, width: 1.0),
        columnWidths: {
          0: FixedColumnWidth(width * 0.02), // Width of the first column
          1: FixedColumnWidth(width * 0.3), // Width of the second column
          2: FixedColumnWidth(width * 0.1),
          3: FixedColumnWidth(width * 0.1),
          4: FixedColumnWidth(width * 0.06),
          5: FixedColumnWidth(width * 0.1),
          6: FixedColumnWidth(width * 0.06), // Width of the third column
        },
        children: [
          TableRow(
            children: [
              TableNameColumn(name: 't'),
              TableNameColumn(name: 'name'),
              TableNameColumn(name: 'BarCode'),
              TableNameColumn(name: 'singleprice'),
              TableNameColumn(name: 'count'),
              TableNameColumn(name: 'allprice'),
              TableNameColumn(name: 'delete'),
            ],
          ),
          ...ListViewGenerateInTable(['data', 'ahmed','ali','10','2','20','delete']),
        ],
      ),
    );
  }
}

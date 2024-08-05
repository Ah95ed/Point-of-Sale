
import 'package:flutter/material.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/TableNameColumnTitle.dart';

class TableInPurchase extends StatelessWidget {
  const TableInPurchase({
    super.key,
   
  });



  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Container(
      color: ColorUsed.whitesoft,
      height: height * 0.6,
      width: MediaQuery.sizeOf(context).width,
      child: Table(
        border: TableBorder.all(color: ColorUsed.blueDark, width: 1.0),
        columnWidths: {
          0: FixedColumnWidth(
              width * 0.02), // Width of the first column
          1: FixedColumnWidth(
              width * 0.3), // Width of the second column
          2: FixedColumnWidth(width * 0.1),
          3: FixedColumnWidth(width * 0.1),
          4: FixedColumnWidth(width * 0.06),
          5: FixedColumnWidth(width * 0.1),
          6: FixedColumnWidth(
              width * 0.06), // Width of the third column
        },
        children: [
          TableRow(
            decoration: BoxDecoration(color: ColorUsed.lightBlue),
            children: [
              TableNameColumn(name: 't'),
              TableNameColumn(name: 'name'),
              TableNameColumn(name: 'BarCode'),
              TableNameColumn(name: 'singleprice'),
              TableNameColumn(name: 'count'),
              TableNameColumn(name: 'allprice'),
              const Padding(
                padding: EdgeInsets.only(top: 4),
                child: Icon(
                  Icons.delete,
                ),
              ),
            ],
          ),
          ...List.generate(
            10,
            (i) {
              return TableRow(
                children: [
                  const Center(child: Text('1')),
                  const Center(child: Text('data')),
                  const Center(child: Text('data')),
                  const Center(child: Text('data')),
                  const Center(child: Text('data')),
                  const Center(child: Text('data')),
                  Center(
                    child: IconButton(
                      onPressed: () {
                      },
                      icon: const Icon(
                        Icons.recycling,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
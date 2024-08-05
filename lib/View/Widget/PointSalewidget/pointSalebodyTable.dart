
import 'package:flutter/material.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';


import 'package:point_of_sell/View/Widget/PointSalewidget/pointSaletableBody.dart';

class PointofSaleTable extends StatelessWidget {
  const PointofSaleTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final hi = MediaQuery.of(context).size.height;
    return Container(
      color: ColorUsed.whitesoft,
      height: hi / 1.5,
      width: MediaQuery.sizeOf(context).width,
      child: const PointSaleTableBody(),
    
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:sizer/sizer.dart';

class CardSaleScreen extends StatelessWidget {
  CardSaleScreen({
    this.id,
    this.name,
    this.barcode,
    this.pricesingle,
    this.count,
    this.allprice,
    super.key,
  });
  String? id, name, barcode, pricesingle, count, allprice;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUsed.whitesoft,
      height: 3.h,
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextCustomSale(
              width: 4.w,
              text: 'id',
            ),
            TextCustomSale(
              width: 50.w,
              text: 'name',
            ),
            TextCustomSale(
              width: 30.w,
              text: 'barcode',
            ),
            TextCustomSale(
              width: 20.w,
              text: 'pricesingle',
            ),
            TextCustomSale(
              width: 15.w,
              text: 'count'.tr,
            ),
            TextCustomSale(
              width: 20.w,
              text: 'allprice'.tr,
            ),
            Container(
              color: ColorUsed.blueDark,
              width: 8.w,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  size: 24,
                  color: ColorUsed.whitesoft,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextCustomSale extends StatelessWidget {
  TextCustomSale({this.width, this.text, super.key});
  String? text;
  double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 2.h,
      decoration: BoxDecoration(
        color: ColorUsed.whiteBlue,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(4),
          top: Radius.circular(4),
        ),
      ),
      child: Center(
        child: Text(
          text!,
          style: TextStyle(
            color: Colors.black,
            fontSize: 6.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

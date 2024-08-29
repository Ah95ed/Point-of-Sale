import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/SizeApp/SizeApp.dart';

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
      height: getHeight(3),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextCustomSale(
              width: getWidth(4),
              text: 'id',
            ),
            TextCustomSale(
              width: getWidth(50),
              text: 'name',
            ),
            TextCustomSale(
              width: getWidth(30),
              text: 'barcode',
            ),
            TextCustomSale(
              width: getWidth(20),
              text: 'pricesingle',
            ),
            TextCustomSale(
              width: getWidth(15),
              text: 'count'.tr,
            ),
            TextCustomSale(
              width: getWidth(20),
              text: 'allprice'.tr,
            ),
            Container(
              color: ColorUsed.blueDark,
              width: getWidth(5),
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
      height: getHeight(2),
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
            fontSize: getFontSize(6),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

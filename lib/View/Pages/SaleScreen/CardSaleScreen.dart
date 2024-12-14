import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';

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
      height: context.getHeight(3),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextCustomSale(
              width: context.getWidth(4),
              text: 'id',
            ),
            TextCustomSale(
              width: context.getWidth(50),
              text: 'name',
            ),
            TextCustomSale(
              width: context.getWidth(30),
              text: 'barcode',
            ),
            TextCustomSale(
              width: context.getWidth(20),
              text: 'pricesingle',
            ),
            TextCustomSale(
              width: context.getWidth(15),
              text: 'count'.tr,
            ),
            TextCustomSale(
              width: context.getWidth(20),
              text: 'allprice'.tr,
            ),
            Container(
              color: ColorUsed.blueDark,
              width: context.getWidth(5),
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
      height: context.getHeight(2),
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
            fontSize: context.getFontSize(6),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

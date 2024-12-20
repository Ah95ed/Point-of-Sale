import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/HomeController.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';
import '../../Colors/Colors.dart';
import '../../Widget/TextField.dart';

class UpdatePrice extends StatelessWidget {
  UpdatePrice({super.key});
  TextEditingController Sale = TextEditingController();

  TextEditingController Buy = TextEditingController();
  // HomeController controller = Get.find(); //!
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('update_price'.tr),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 4,
                child: TextFieldCustom(
                  name: 'sale_price'.tr,
                  icons: Icons.person,
                  text: Sale,
                ),
              ),
              Expanded(
                flex: 1,
                child: OutlinedButton(
                  onPressed: () async {
                    await controller.updateSalePrice(
                      double.parse(Sale.text),
                    );
                    Sale.clear();
                  },
                  child: Text(
                    'sale_price'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorUsed.appBarColor,
                      fontSize:  context.getFontSize(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
           SizedBox(
            height:  context.getHeight(18),
          ),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: TextFieldCustom(
                  name: 'buy_price'.tr,
                  icons: Icons.price_change,
                  text: Buy,
                ),
              ),
              Expanded(
                flex: 1,
                child: OutlinedButton(
                  onPressed: () async {
                    await controller.updateBuyPrice(
                      double.parse(Buy.text),
                    );
                    Buy.clear();
                  },
                  child: Text(
                    'buy_price'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorUsed.appBarColor,
                      fontSize: context.getFontSize(8),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

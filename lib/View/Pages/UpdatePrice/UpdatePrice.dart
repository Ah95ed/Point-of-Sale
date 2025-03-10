import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/HomeController.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';
import '../../Colors/Colors.dart';
import '../../Widget/TextField.dart';

class UpdatePrice extends StatefulWidget {
  UpdatePrice({super.key});

  @override
  State<UpdatePrice> createState() => _UpdatePriceState();
}

class _UpdatePriceState extends State<UpdatePrice> {
  late TextEditingController Sale;

  late TextEditingController Buy;
  @override
  void initState() {
    Sale = TextEditingController();
    Buy = TextEditingController();
    Sale.addListener(_handleTextChange);
    Buy.addListener(_handleTextChange);
    fetchData();
    super.initState();
  }

  void _handleTextChange() {
    print(Sale.text);
    print(Buy.text);
  }

  Future<void> fetchData() async {
    await Future.delayed(const Duration(seconds: 2)); // محاكاة انتظار بيانات
    if (mounted) {
     
          Sale.text = "";
       Buy.text = "";
   
    
    }
  }

  @override
  void dispose() {
    Sale.removeListener(_handleTextChange);
    Buy.removeListener(_handleTextChange);
    Sale.dispose();
    Buy.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('update_price'.tr),
        ),
        body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return Column(
              children: [
                TextFieldCustom(
                  name: 'sale_price'.tr,
                  icons: Icons.price_change,
                  text: Sale,
                ),
                OutlinedButton(
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
                      fontSize: context.getFontSize(14),
                    ),
                  ),
                ),
                SizedBox(
                  height: context.getHeight(32),
                ),
                Divider(
                  color: ColorUsed.appBarColor,
                  thickness: 1,
                  endIndent: context.getWidth(16),
                  indent: context.getWidth(16),
                ),
                SizedBox(
                  height: context.getHeight(32),
                ),
                TextFieldCustom(
                  name: 'buy_price'.tr,
                  icons: Icons.price_change,
                  text: Buy,
                ),
                OutlinedButton(
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
                      fontSize: context.getFontSize(14),
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}

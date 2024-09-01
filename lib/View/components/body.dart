import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Helper/Log/Logger.dart';
import 'package:point_of_sell/View/style/SizeApp/SizeApp.dart';

// import 'IconCompany.dart';
import 'clock.dart';
// import 'country_card.dart';
import 'time_in_hour_and_minute.dart';

class Body extends StatelessWidget {
  Body({super.key});
  final width = Get.width;
  final height = Get.height;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: context.getHeight(100)
         - context.getAppBarHeightWithStatusBar(),
        width: getWidth(100) ,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/image/show.png"),
            fit: width > 600 ? BoxFit.cover : BoxFit.contain,
          ),
        ),
        child: Column(
          children: [
           
            SizedBox(
              height: context.getHeight(10),
              child: Text(
                "Newport Beach, USA | PST",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const TimeInHourAndMinute(),
            // const Spacer(),
            SizedBox(
              height: context.getHeight(60),
              child: const Clock(),
            ),
          
          ],
        ),
      ),
    );
  }
}

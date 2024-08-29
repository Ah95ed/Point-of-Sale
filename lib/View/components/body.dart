import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/View/SizeApp/SizeApp.dart';

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
    // double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        height: getHeight(100),
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
              height: height * 0.001,
            ),
            SizedBox(
              height: height * 0.1,
              child: Text(
                "Newport Beach, USA | PST",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const TimeInHourAndMinute(),
            // const Spacer(),
            SizedBox(
              height: height * 0.7,
              child: const Clock(),
            ),
            // const Spacer(),
            // const IconCompany(),
            // child: SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
            //       CountryCard(
            //         country: "New York, USA",
            //         timeZone: "+3 HRS | EST",
            //         iconSrc: "assets/icons/Liberty.svg",
            //         time: "9:20",
            //         period: "PM",
            //       ),
            //       CountryCard(
            //         country: "Sydney, AU",
            //         timeZone: "+19 HRS | AEST",
            //         iconSrc: "assets/icons/Sydney.svg",
            //         time: "1:20",
            //         period: "AM",
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

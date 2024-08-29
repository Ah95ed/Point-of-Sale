import 'package:flutter/material.dart';
import 'package:get/get.dart';


extension SizedApp on BuildContext {
  bool get isLandscape => MediaQuery.of(this).orientation
   == Orientation.landscape;

   double getHeight(double? h) 
   => isLandscape
    ? MediaQuery.of(this).size.width * h! / 100 
   : MediaQuery.of(this).size.height * h! / 100;

   double getWidth(double? w) 
   => isLandscape
    ? MediaQuery.of(this).size.height * w! / 100 
   : MediaQuery.of(this).size.width * w! / 100;


}
  bool get isLandscape => MediaQuery.of(Get.context!).orientation
   == Orientation.landscape;
// ! this to calculate height screen part from 100;
double getHeight(double? h) {
  if (h == null) return MediaQuery.of(Get.context!).size.height;
  return  MediaQuery.of(Get.context!).size.height * h / 100;
}

// ! this to calculate width screen part from 100;
double getWidth(double? w) {
  if (w == null) return MediaQuery.of(Get.context!).size.height;
  
 return MediaQuery.of(Get.context!).size.width * w / 100;
}

// ! here to return fontsize in all screen
double getFontSize(double? f) {
  if (f == null) return 12;
  return isLandscape 
  ? (MediaQuery.of(Get.context!).size.height / 3) * f / 100
  : (MediaQuery.of(Get.context!).size.width / 3) * f / 100;
}

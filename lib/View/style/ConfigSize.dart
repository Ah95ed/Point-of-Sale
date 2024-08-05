import 'package:get/get.dart';

class Configsize {
  static final double h = Get.height;
  static final double w = Get.width;

  static double getHeight(double height) {
    return h * height;
  }

  static double getWidth(double width) {
    return w * width;
  }
}

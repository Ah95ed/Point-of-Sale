import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/View/style/SizeApp/SizeBuilder.dart';

extension SizedApp on BuildContext {

  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  double get screenHeight => isLandscape
      ? MediaQuery.sizeOf(this).width
      : MediaQuery.sizeOf(this).height;

  double get screenWidth => isLandscape
      ? MediaQuery.sizeOf(this).height
      : MediaQuery.sizeOf(this).width;


  SizeBuilder get sizeBuilder => SizeBuilder.of(this);
  double get scaleWidth => sizeBuilder.width / sizeBuilder.baseSize.width;
  double get scaleHeight => sizeBuilder.height / sizeBuilder.baseSize.height;


  // ! this to calculate height screen part from 100;
  double getHeight(num h) {
    return h * scaleHeight;
  }


  // ! this to calculate width screen part from 100;
  double getWidth(num w) {
    return w * scaleWidth;
  }


// ! here to return font size in all screen
  double getFontSize(num f) {
    return f * scaleWidth;
  }


  double getMinSize(num f) {
    return f * min(scaleWidth, scaleHeight);
  }
  bool get isMobile => MediaQuery.sizeOf(this).width < 800;
  double get Height => MediaQuery.sizeOf(this).height;
  double get Width => MediaQuery.sizeOf(this).width;

  double getAppBarHeightWithStatusBar() {
    return AppBar().preferredSize.height +
    MediaQuery.of(this).padding.top;
  }


  double onOpenKeyBorad() {
    return MediaQuery.of(this).viewInsets.bottom;
  }

  double getArea(double area) {
    return (area / height) *100;
  }
}

bool get isLandscape =>
    MediaQuery.of(Get.context!).orientation == Orientation.landscape;
// ! this to calculate height screen part from 100;
double getHeight(double? h) {
  if (h == null) return MediaQuery.of(Get.context!).size.height;
  return MediaQuery.of(Get.context!).size.height * h / 100;
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

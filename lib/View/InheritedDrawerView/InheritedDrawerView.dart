import 'package:flutter/material.dart';

class InheritedDrawerView extends InheritedWidget {
  InheritedDrawerView({required super.child});

  static InheritedDrawerView dataOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedDrawerView>()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedDrawerView oldWidget) {
    return false;
  }
}

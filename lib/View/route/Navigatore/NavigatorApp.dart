import 'package:flutter/material.dart';

class NavigatoreApp {
  static Future<void> pushName(
      String route, bool b, BuildContext context) async {
    Navigator.pushNamed(context, route);
  }
  
}

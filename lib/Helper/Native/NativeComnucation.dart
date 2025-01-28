import 'package:flutter/services.dart';
import 'package:point_of_sell/Helper/Log/LogApp.dart';

class NativeComnucation {
  static const platform = MethodChannel('com.example.app/channel');

   Future<String> runJavaCode() async {
    try {
      final result = await platform.invokeMethod('runJavaCode');
      logSuccess(await result.toString());
      // الناتج من Java
      return result.toString();
    } on PlatformException catch (e) {
      logInfo("Error: ${e.message}");
    }
    return "Error";
  }
}

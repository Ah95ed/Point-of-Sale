import 'package:flutter/material.dart';
import 'package:point_of_sell/View/style/SizeApp/DeviceUtils.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final Scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    
        return Center(
          child: Image.asset(
            'assets/image/show.png',
            fit: DeviceUtils.isMobile(context) ? BoxFit.contain:BoxFit.cover,
            height: context.screenWidth,
            width: context.screenHeight,
            alignment: Alignment.center,
          ),
        );
  }
}

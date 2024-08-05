import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Widget/UsersLiabilityCard.dart';

class UserINfo extends StatelessWidget {
  final int userId;

  const UserINfo({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'account_liability'.tr,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: ColorUsed.appBarColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child:UsersLiabilityCard(id: userId),
      ),
    );
  }
}

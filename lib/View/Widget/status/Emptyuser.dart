import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/View/Widget/addifnot.dart';

class Emptyuser extends StatelessWidget {
  const Emptyuser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("There is no users add one ?"),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
              onPressed: () => Get.to(() => const AddUser()),
              child: const Text("Add New User")),
        ],
      ),
    ));
  }
}

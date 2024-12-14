import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Empty extends StatelessWidget {
  const Empty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("There is no data to add a new item"),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            // onPressed: () => Get.to(const AddItems()),
            onPressed: (){},
            child: const Text("Add New Item"),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/LiabilityDataBase.dart';

class AddUser extends StatelessWidget {
  const AddUser({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Enter user name'),
              subtitle: TextFormField(
                controller: userNameController,
                decoration: const InputDecoration(
                  hintText: 'User Name',
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String userName = userNameController.text;
                if (userName.isNotEmpty) {
                  LiabilityDataBase database = LiabilityDataBase();
                  database.insert_li_user(userName);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('User added successfully')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a user name')),
                  );
                }
                Get.back();
              },
              child: const Text("Add User"),
            ),
          ],
        ),
      ),
    );
  }
}

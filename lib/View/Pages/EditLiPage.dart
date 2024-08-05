import 'package:flutter/material.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/LiabilityDataBase.dart';

class EditLiPage extends StatefulWidget {
  final int id;
  const EditLiPage({required this.id, super.key});

  @override
  _EditLiPageState createState() => _EditLiPageState();
}

class _EditLiPageState extends State<EditLiPage> {
  late TextEditingController userNameController;
  String? username = '';

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    // Fetch the username when the widget initializes
    fetchUsername();
  }

  Future<void> fetchUsername() async {
    // Fetch the username asynchronously
    String? fetchedUsername = (await getusername(widget.id)) as String?;
    // Update the username
    setState(() {
      username = fetchedUsername;
      userNameController.text = username ?? '';
    });
  }

  Future<Object?> getusername(int id) async {
    LiabilityDataBase db = LiabilityDataBase();
    return await db.getUserNameById(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Edit the user name'),
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
                  database.updateLiabilityuser(widget.id, userName);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('User Edited successfully')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a user name')),
                  );
                }
              },
              child: const Text("Edit User"),
            ),
          ],
        ),
      ),
    );
  }
}

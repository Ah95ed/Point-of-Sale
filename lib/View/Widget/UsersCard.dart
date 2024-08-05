// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/LiabilityDataBase.dart';
import 'package:point_of_sell/View/Pages/EditLiPage.dart';

class UsersCard extends StatelessWidget {
  final String username;
  final String all_mony;
  final int id;
  const UsersCard(
      {super.key,
      required this.username,
      required this.all_mony,
      required this.id});
  void delete(int id) {
    LiabilityDataBase db = LiabilityDataBase();
    db.deleteLiUsRecordById(id);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Row(
          children: [
            const Icon(Icons.person),
            Text(
              username,
              style: const TextStyle(fontSize: 20.0),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            const Icon(Icons.attach_money_outlined),
            Text(
              all_mony,
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () async {
                delete(id);
              },
              icon: const Icon(Icons.delete),
            ),
            IconButton(
              onPressed: () {
                Get.to(EditLiPage(id: id));
              },
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
      ),
    );
  }
}

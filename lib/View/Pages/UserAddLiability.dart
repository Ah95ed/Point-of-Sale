// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/LiabilityDataBase.dart';
import 'package:point_of_sell/View/Widget/SelectDate.dart';
import 'package:point_of_sell/View/Widget/TextField.dart';

class UserAddLiability extends StatelessWidget {
  final int id;
  UserAddLiability({super.key, required this.id});

  LiabilityDataBase? data;

  TextEditingController name = TextEditingController();

  TextEditingController prise = TextEditingController();

  TextEditingController quantity = TextEditingController();

  TextEditingController date = TextEditingController(
      text:
          (DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now()).toString()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Liability"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<Object?>(
              future: getUserName(id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Text("Add Liability for ${snapshot.data}",
                      style: const TextStyle(fontSize: 25));
                }
              },
            ),
            TextFieldCustom(
              name: 'itemName'.tr,
              icons: Icons.shape_line,
              text: name,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFieldCustom(
              name: 'quantity'.tr,
              icons: Icons.shape_line,
              text: quantity,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFieldCustom(
              name:'price'.tr,
              icons: Icons.price_change,
              text: prise,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFieldCustom(
                    name: 'date'.tr,
                    icons: Icons.date_range,
                    text: date,
                  ),
                ),
                SelectDate(dateCtrl: date),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                LiabilityDataBase db = LiabilityDataBase();
                db.insert_li(
                    id, name.text, quantity.text, prise.text, date.text);
                name.clear();
                date.clear();
                quantity.clear();
                prise.clear();
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  Future<Object> getUserName(int id) async {
    LiabilityDataBase db = LiabilityDataBase();
    return await db.getUserNameById(id) ?? '';
  }
}

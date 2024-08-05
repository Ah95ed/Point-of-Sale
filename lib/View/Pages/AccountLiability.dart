import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Widget/status/Emptyuser.dart';
import 'package:point_of_sell/View/Pages/UserINfo.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/LiabilityDataBase.dart';
import 'package:point_of_sell/View/Widget/UsersCard.dart';
import 'package:point_of_sell/View/Widget/addifnot.dart';


class AccountLiability extends StatelessWidget {
  const AccountLiability({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "account_liability".tr,
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
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: _getAllRecords(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final records = snapshot.data ?? [];
              return _buildContent(records);
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => const AddUser());
            },
            backgroundColor: Colors.red,
            child: const Icon(Icons.add)));
  }

  Future<List<Map<String, dynamic>>> _getAllRecords() async {
    LiabilityDataBase database = LiabilityDataBase();
    return await database.getAllLiabilitiesuser();
  }

  Future<String> _allmony(int id) async {
    LiabilityDataBase database = LiabilityDataBase();
    var records = await database.getCusLiabilities(id);
    double totalPrice = 0;
    for (var record in records) {
      totalPrice += int.parse(record['prise']);
    }
    return totalPrice.toString();
  }

  Widget _buildContent(List<Map<String, dynamic>> records) {
    return records.isNotEmpty
        ? ListView(
            children: records.map((record) {
              return FutureBuilder<String>(
                future: _allmony(record['ID']),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return InkWell(
                      onTap: () {
                        Get.to(() => UserINfo(userId: record['ID']));
                      },
                      child: UsersCard(
                          username: record['Li_users_name'],
                          all_mony: snapshot.data ?? "",
                          id: record['ID']),
                    );
                  }
                },
              );
            }).toList(),
          )
        : const Emptyuser();
  }
}

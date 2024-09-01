import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/LiabilityDataBase.dart';
import 'package:point_of_sell/View/Pages/UserAddLiability.dart';
import 'package:point_of_sell/View/Pages/EditPage.dart';

class UsersLiabilityCard extends StatefulWidget {
  final int id;
  const UsersLiabilityCard({super.key, required this.id});

  @override
  _UsersLiabilityCardState createState() => _UsersLiabilityCardState();
}

class _UsersLiabilityCardState extends State<UsersLiabilityCard> {
  late Future<List<Map<String, dynamic>>> _data;

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  void _refreshData() {
    setState(() {
      _data = GetData(widget.id);
    });
  }

  Future<Object?> getname(int id) async {
    LiabilityDataBase db = LiabilityDataBase();
    return await db.getUserNameById(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final data = snapshot.data ?? [];

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final record = data[index];
                return Card(
                  child: ListTile(
                    title: Text('Date: ${record['li_date']}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Product: ${record['item']}'),
                        Text('Quantity: ${record['li_quantity']}'),
                        Text('Price: ${record['prise']}'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () async {
                            LiabilityDataBase db = LiabilityDataBase();
                            await db.deleteLiRecordById(record["ID"]);
                            _refreshData();
                          },
                          icon: const Icon(Icons.delete),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.to(EditPage(record["ID"]));
                          },
                          icon: const Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(UserAddLiability(id: widget.id));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<List<Map<String, dynamic>>> GetData(int id) async {
    LiabilityDataBase db = LiabilityDataBase();
    return await db.getCusLiabilities(id);
  }
}

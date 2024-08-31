import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/LiabilityDataBase.dart';
import 'package:point_of_sell/View/Widget/SelectDate.dart';
import 'package:point_of_sell/View/Widget/TextField.dart';

class EditPage extends StatefulWidget {
  final int id;

  const EditPage(this.id, {super.key});

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  LiabilityDataBase? data;

  TextEditingController name = TextEditingController();
  TextEditingController prise = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController date = TextEditingController(
      text: DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now()).toString());

  @override
  void initState() {
    super.initState();
    setter();
  }

  void setter() async {
    LiabilityDataBase db = LiabilityDataBase();
    List<Map<String, dynamic>>? data = await db.getLiabilitieWithID(widget.id);
    setState(() {
      name.text = data[0]['item'] ?? '';
      prise.text = data[0]['prise'] ?? '';
      quantity.text = data[0]['li_quantity'] ?? '';
      date.text = data[0]['li_date'] ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Liability"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder<Object?>(
                future: getUserName(widget.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const Text(
                      "Edit",
                      style: TextStyle(fontSize: 25),
                    );
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
                name: 'price'.tr,
                icons: Icons.shape_line,
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
                  db.updateLiability(
                    widget.id,
                    name.text,
                    quantity.text,
                    prise.text,
                    date.text,
                  );
                  Get.back();
                },
                child: const Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Object> getUserName(int id) async {
    LiabilityDataBase db = LiabilityDataBase();
    return await db.getUserNameById(id) ?? '';
  }
}

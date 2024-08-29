import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/AccountOrdersDataBase.dart';
import 'package:point_of_sell/View/Widget/AlertDialog.dart';
import '../Model/Models/DataBaseApp/DataBaseSqflite.dart';
import '../Model/Models/Items.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountController extends GetxController {
  late DataBaseSqflite dataBaseSqflite;
  late AccountOrdersDataBase account;

  List<Items> search = [];
  int skip = 0;
  int limit = 20;
  List<Items> order = [];
  List<Items>? newResult = [];
  double resultSell = 0.0;
  double count = 0.0;
  int i = 0;
  TextEditingController? controller;

  static const String Result = 'Result';
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  SharedPreferences? _prefs;

  @override
  void onInit() {
    controller = TextEditingController();
    dataBaseSqflite = DataBaseSqflite();
    account = AccountOrdersDataBase();
    getShared();
    super.onInit();
  }

  getShared() async {
    _prefs = await prefs;
    if (_prefs!.getDouble('result') != null) {
      resultSell = _prefs!.getDouble('result')!;
      update();
    }
  }

  void saveShared() async {
    _prefs = await prefs;
    _prefs!.setDouble('result', resultSell);
    log('message saved done  ___');
  }

  void deleteShared() async {
    _prefs = await prefs;
    _prefs!.remove('result');
  }

  @override
  void onClose() {
    // TODO: implement onClose
    saveShared();
    super.onClose();
  }

  Widget title = const Text('Account');
  Icon actionsicon = const Icon(
    Icons.search,
    color: Colors.white,
  );
  final TextEditingController text = TextEditingController();
  Future<void> changeWidget() async {
    if (actionsicon.icon == Icons.search) {
      // copy = search;
      // search.clear();
      // d = true;
      actionsicon = const Icon(
        Icons.close,
        color: Colors.white,
      );

      title = TextFormField(
        controller: text,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          labelText: 'search',
          focusedBorder: OutlineInputBorder(),
          labelStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.start,
        autofocus: true,
        onChanged: (value) {
          // searchInData(value.toString());
        },
      );
      update();
    } else {
      // search = copy;
      // copy.clear();
      // search.clear();
      // d = false;
      actionsicon = const Icon(
        Icons.search,
        color: Colors.white,
      );
      title = const Text(
        'Account',
        style: TextStyle(
          color: Colors.white,
        ),
      );
      // getDataFromAccount();
      update();
    }
  }

  Future<void> searchCodeOrder(String s) async {
    order = List.from(search);
    log('message $s');

    i = 0;
    List<Map<String, dynamic>>? result = await account.searchBarCodeOrder(s);
    newResult = result
        .map(
          (item) => Items(
            name: item[DataBaseSqflite.name],
            code: item[DataBaseSqflite.codeItem],
            sale: item[DataBaseSqflite.sale],
            buy: item[DataBaseSqflite.buy],
            id: item[DataBaseSqflite.id].toString(),
            quantity: item[DataBaseSqflite.quantity],
            company: item[DataBaseSqflite.company],
            date: item[DataBaseSqflite.date],
            time: item[DataBaseSqflite.time] ?? 'ah',
          ),
        )
        .toList();
    if (newResult!.isEmpty) {
      Get.snackbar('title', 'empty', snackPosition: SnackPosition.BOTTOM);
      // ScaffoldMessenger.of(Get.context!).showSnackBar(
      //   const SnackBar(
      //     content: Text('Empty'),
      //   ),
      // );
      controller!.clear();
      update();
      return;
    }

    Get.dialog(AlertDialogCustom(), useSafeArea: true);
  }

  void addSaleAndupdatePrice() {
    account.insertInAccount(
      {
        DataBaseSqflite.name: newResult![i].name,
        DataBaseSqflite.sale: newResult![i].sale,
        DataBaseSqflite.quantity: text.text,
      },
    );
    count = double.parse(text.text);
    resultSell += count * double.parse(newResult![i].sale);
    i++;
    controller!.clear();

    search.addAll(newResult!);
    newResult!.clear();
    update();
  }

  Future<void> deleteAllAccount() async {
    await account.deleteAccount();
    search.clear();
    update();
  }

  Future<void> getDataFromAccount() async {
    var dataList = await account.getAllDataFromAccount();
    var item = dataList.map((i) {
       log('message ===> ${i![DataBaseSqflite.id].toString()}');
      return Items(
        name: i[DataBaseSqflite.name].toString(),
        code: i[DataBaseSqflite.codeItem].toString(),
        sale: i[DataBaseSqflite.sale].toString(),
        buy: i[DataBaseSqflite.buy].toString(),
        quantity: i[DataBaseSqflite.quantity].toString(),
        id: i[DataBaseSqflite.id].toString(),
        company: i[DataBaseSqflite.company].toString(),
        date: i[DataBaseSqflite.date].toString(),
        time: i[DataBaseSqflite.time].toString(),
      );
      
    }).toList();
   
    search.clear();
    search.addAll(item);
    update();
  }

  Future<void> insertInAccount(Map<String, dynamic> data) async {
    await account.insertInAccount(data);

    update();
  }

  Future<void> deleteItem(String id, String sell) async {
    await account.delete(id);
    search.clear();
    if (resultSell <= 0.0) return;
    resultSell = resultSell - double.parse(sell);

    getDataFromAccount();
    update();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}

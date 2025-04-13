import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:point_of_sell/Helper/Log/LogApp.dart';
import 'package:point_of_sell/Helper/Service/Service.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/AccountOrdersDataBase.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/CustomersDataBase.dart';
import 'package:point_of_sell/Model/Models/Pdf/PdfApi.dart';
import 'package:point_of_sell/View/Widget/AlertDialog.dart';
import 'package:printing/printing.dart';
import '../Model/Models/DataBaseApp/DataBaseSqflite.dart';
import '../Model/Models/Items.dart';

class AccountController extends GetxController {
  late DataBaseSqflite dataBaseSqflite;
  late AccountOrdersDataBase account;
  late CustomersDatabase customersDatabase;
  late PdfApi pdfApi;

  List<Items> search = [];
  int skip = 0;
  int limit = 20;
  List<Items> order = [];
  List<Items>? newResult = [];
  double resultSell = 0.0;
  double count = 0.0;
  int i = 0;

  static const String Result = 'Result';

  @override
  void onInit() {
    dataBaseSqflite = DataBaseSqflite();
    account = AccountOrdersDataBase();
    customersDatabase = CustomersDatabase();
    getNameCustomer();
    super.onInit();
    getShared();
  }

  Future<void> updateAccount(Map<String, dynamic> data) async {
    await account.updateAccount(data);
    search.clear();
    getDataFromAccount();
    update();
  }

  List<Map<String, dynamic>?> items = [];
  Future<void> getNameCustomer() async {
    items = await customersDatabase.getAllCustomrers();
 
    update();
  }

  getShared() async {
    if (sharep!.getDouble('result') != null) {
      resultSell = sharep!.getDouble('result')!;
      update();
    }
  }

  void saveShared() async {
    sharep!.setDouble('result', resultSell);
  }

  void deleteShared() async {
    sharep!.remove('result');
  }

  @override
  void onClose() {
    // Log.log('close');
    saveShared();
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      // حفظ البيانات هنا
      sharep!.setDouble('result', resultSell);
      // saveShared();
      log('message saved Done  __________________________ ');
    }
  }

  void getDataCustomers(String id_customer) async {
    List r = await account.getDataCustomers(id_customer);
    for (var element in r) {
      search.add(
        Items.FromAccountData(
          element[DataBaseSqflite.name].toString(),
          element[DataBaseSqflite.sale].toString(),
          element[DataBaseSqflite.quantity].toString(),
          element[DataBaseSqflite.id].toString(),
        ),
      );
    }
    update();
  }

  Future<void> printOrder() async {
    pdfApi = PdfApi();
    final pdfFile = await pdfApi.generatePdf(PdfPageFormat.a4, 'مستند مثال');

    // طباعة PDF
    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdfFile);

    // // حفظ PDF
    // await pdfApi.savePdf(pdfFile);
  }

  Widget title = const Text('Account');
  Icon actionsicon = const Icon(Icons.search, color: Colors.white);
  final TextEditingController text = TextEditingController();
  Future<void> changeWidget() async {
    if (actionsicon.icon == Icons.search) {
      actionsicon = const Icon(Icons.close, color: Colors.white);

      title = TextFormField(
        controller: text,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          labelText: 'search',
          focusedBorder: OutlineInputBorder(),
          labelStyle: TextStyle(color: Colors.white),
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
      actionsicon = const Icon(Icons.search, color: Colors.white);
      title = const Text('Account', style: TextStyle(color: Colors.white));
      update();
    }
  }

  Future<void> insertCustomer(Map<String, dynamic> data) async {
    await customersDatabase.insertCustomers(data);
   await getNameCustomer();
    update();
  }

  Future<void> searchCodeOrder(String s, String id_customer) async {
    i = 0;
    List<Map<String, dynamic>>? result = await account.searchBarCodeOrder(s);
    newResult =
        result
            .map(
              (item) => Items.FromAccountData(
                item[DataBaseSqflite.name],
                item[DataBaseSqflite.sale],
                item[DataBaseSqflite.quantity],
                item[DataBaseSqflite.id].toString(),
              ),
            )
            .toList();
    if (newResult!.isEmpty) {
      Get.snackbar(
        "Not Found",
        'لايوجد هذا العنصر',
        snackPosition: SnackPosition.TOP,
      );

      update();
      return;
    }

    Get.dialog(AlertDialogCustom.FrtomAccount(id_customer), useSafeArea: true);
  }

  void addSaleAndupdatePrice(String id_customer) {
    count = double.parse(text.text);
    final saleDivider = count * double.parse(newResult![i].sale);
    account.insertInAccount({
      AccountOrdersDataBase.id_customer: id_customer,
      DataBaseSqflite.name: newResult![i].name,
      DataBaseSqflite.sale: saleDivider.toString(),
      DataBaseSqflite.quantity: text.text,
    });

    resultSell += saleDivider;
    i++;

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
    logError("message ${dataList}");
    var item =
        dataList.map((i) {
          return Items.FromAccountData(
            i![DataBaseSqflite.name].toString(),
            i[DataBaseSqflite.sale].toString(),
            i[DataBaseSqflite.quantity].toString(),
            i[DataBaseSqflite.id].toString(),
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

    await getDataFromAccount();
    update();
  }

  @override
  void dispose() {
    saveShared();
    text.dispose();
    super.dispose();
  }
}

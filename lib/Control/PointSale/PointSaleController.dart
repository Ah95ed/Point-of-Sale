import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/AccountOrdersDataBase.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/DataBaseSqflite.dart';
import 'package:point_of_sell/Model/Models/Items.dart';
import 'package:point_of_sell/View/Widget/TextField.dart';

class PointSaleController extends GetxController {
  List<Items> newResult = [];
  List<Items> search = [];
  double resultSell = 0.0;
  late AccountOrdersDataBase account;
  final TextEditingController text = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  
    account = AccountOrdersDataBase();
      getDataFromAccount();
  }

  @override
  void dispose() {
    text.dispose();
    super.dispose();
  }

  Future<void> searchCodeOrder(String s) async {
    List<Map<String, dynamic>>? result = await account.searchBarCodeOrder(s);
    newResult =
        result
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
                time: item[DataBaseSqflite.time] ?? '00:00',
              ),
            )
            .toList();
    if (newResult.isEmpty) {
      Get.snackbar(
        "Not Found",
        'لايوجد هذا العنصر',
        snackPosition: SnackPosition.TOP,
      );

      update();
      return;
    }

    Get.dialog(
      AlertDialog(
        title: const Text('Add Count Item '),
        content: TextFieldCustom(
          name: 'name',
          icons: Icons.numbers,
          text: text,
          input: TextInputType.number,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.close),
              ),
              IconButton(
                onPressed: () {
                  addSaleAndupdatePrice();
                  Get.back();
                },
                icon: const Icon(Icons.done),
              ),
            ],
          ),
        ],
      ),
      useSafeArea: true,
    );
  }

  double count = 0.0;
  double saleDivider = 0.0;
  void addSaleAndupdatePrice() {
    count = double.parse(text.text);
    for (var element in newResult) {
      saleDivider = count * double.parse(element.sale);
      account.insertInAccount({
        DataBaseSqflite.name: element.name,
        DataBaseSqflite.sale: saleDivider.toString(),
        DataBaseSqflite.quantity: text.text,
      });
    }

    resultSell += saleDivider;

    search.addAll(newResult);
    newResult.clear();
    update();
  }

  Future<void> getDataFromAccount() async {
    var dataList = await account.getAllDataFromAccount();
    var item =
        dataList.map((i) {
          return Items(
            name: i![DataBaseSqflite.name].toString(),
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
}

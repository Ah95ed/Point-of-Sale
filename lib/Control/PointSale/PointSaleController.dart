import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Helper/Service/Service.dart';
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
    sharep!.getString('AllResult');
    account = AccountOrdersDataBase();
    getDataFromAccount();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    sharep!.setString('AllResult', resultSell.toString());
    super.onClose();
  }

  @override
  void onReady() {
    sharep!.getString('AllResult');
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void dispose() {
    text.dispose();
    sharep!.setString('AllResult', resultSell.toString());
    super.dispose();
  }

  void deletefromId(String id) async {
    await account.delete(id);
    search.clear();
    await getDataFromAccount();
    update();
  }

  void deleteAccount() async {
    await account.deleteAccount();
    search.clear();
    update();
  }

  Future<void> searchCodeOrder(String s) async {
    List<Map<String, dynamic>>? result = await account.searchBarCodeOrder(s);
    newResult =
        result
            .map(
              (item) => Items(
                item[DataBaseSqflite.name],
                item[DataBaseSqflite.codeItem],
                item[DataBaseSqflite.sale],
                item[DataBaseSqflite.buy],
                item[DataBaseSqflite.id].toString(),
                item[DataBaseSqflite.quantity],
                item[DataBaseSqflite.company],
                item[DataBaseSqflite.date],
                item[DataBaseSqflite.time] ?? '00:00',
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
                  text.clear();
                  Get.back();
                },
                icon: const Icon(Icons.close),
              ),
              IconButton(
                onPressed: () {
                  if (text.text.isEmpty) {
                    Get.snackbar(
                      "تحذير",
                      '  اكتب الكمية',
                      snackPosition: SnackPosition.TOP,
                    );
                    return;
                  }
                  addSaleAndupdatePrice();
                  text.clear();
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
            i![DataBaseSqflite.name].toString(),
            i[DataBaseSqflite.codeItem].toString(),
            i[DataBaseSqflite.sale].toString(),
            i[DataBaseSqflite.buy].toString(),
            i[DataBaseSqflite.quantity].toString(),
            i[DataBaseSqflite.id].toString(),
            i[DataBaseSqflite.company].toString(),
            i[DataBaseSqflite.date].toString(),
            i[DataBaseSqflite.time].toString(),
          );
        }).toList();

    search.clear();
    search.addAll(item);
    update();
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/DataBaseSqflite.dart';
import 'package:point_of_sell/Model/Models/Items.dart';
import 'package:point_of_sell/Model/Models/Pdf/PdfApi.dart';

class HomeController extends GetxController {
  final nameFile = TextEditingController();
  List<Items> items = [];
  List<Items> copy = [];
  bool isLaodingMore = false;
  ScrollController controller = ScrollController();
  int skip = 0;
  int limit = 20;
  late DataBaseSqflite dataBaseSqflite;

  // HomeController() {
  //   log('message MyClass created at:\n${StackTrace.current} ');
  //   print('MyClass created at:\n${StackTrace.current}');
  // }

  @override
  void onInit() {
    dataBaseSqflite = DataBaseSqflite();
    paginationData();
    super.onInit();
  }

  Future<void> addItems(
    Map<String, dynamic> data,
  ) async {
    await dataBaseSqflite.insert(data);
    items.clear();
    paginationData();
    update();
  }

  void paginationData() async {
    if (items.isEmpty) {
      getPData();
    }
    controller.addListener(
      () async {
        if (controller.position.pixels == controller.position.maxScrollExtent) {
          isLaodingMore = true;
          getPData();
          skip = skip + limit;
          isLaodingMore = false;
        }
      },
    );
  }

  Future<void> getPData() async {
    var dataList = await dataBaseSqflite.getAllUser(skip, limit);
    var item = dataList
        .map((i) => Items(
              name: i![DataBaseSqflite.name].toString(),
              code: i[DataBaseSqflite.codeItem].toString(),
              sale: i[DataBaseSqflite.sale].toString(),
              buy: i[DataBaseSqflite.buy].toString(),
              quantity: i[DataBaseSqflite.quantity].toString(),
              id: i[DataBaseSqflite.id].toString(),
              company: i[DataBaseSqflite.company].toString(),
              date: i[DataBaseSqflite.date].toString(),
              time: i[DataBaseSqflite.time].toString(),
            ))
        .toList();
    items.addAll(item);
    update();
  }

  Future<void> deleteItem(String id) async {
    items.clear();
    await dataBaseSqflite.delete(id);
    paginationData();
    update();
  }

  Future<void> updateData(
    Map<String, dynamic> data,
    String id,
  ) async {
    items.clear();
    await dataBaseSqflite.updateItem(data, id);
    paginationData();
    update();
  }

  Future<void> updateSalePrice(double v) async {
    items.clear();
    await dataBaseSqflite.updateCostCol(v);
    paginationData();
    update();
  }

  Future<void> updateBuyPrice(double v) async {
    items.clear();
    await dataBaseSqflite.updateBuyCol(v);
    paginationData();
    update();
  }

  Widget title = const Text('Any');
  Icon actionsicon = const Icon(
    Icons.search,
    color: Colors.white,
  );
  final TextEditingController text = TextEditingController();
  Future<void> changeWidget() async {
    if (actionsicon.icon == Icons.search) {
      copy = items;
      actionsicon = const Icon(Icons.close, color: Colors.white);

      title = TextFormField(
        controller: text,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "".tr,
          focusedBorder: const OutlineInputBorder(),
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.start,
        autofocus: true,
        onChanged: (value) {
          searchInData(value.toString());
          //! log('message ... Ahmed _________
          // ${value.toString()}');
        },
      );
      update();
    } else {
      items = copy;
      copy = [];
      actionsicon = const Icon(
        Icons.search,
        color: Colors.white,
      );
      title = const Text('Any');
      update();
      paginationData();
    }
  }

  Future<void> searchInData(String v) async {
    List<Map<String, dynamic>>? data =
        await dataBaseSqflite.searchInDatabase(v);
    /*
اذا رجعت البيانات فارغة توقف  
    */

    if (data.isEmpty) {
      return;
    }
    List<Items> newResult = data
        .map(
          (item) => Items(
            name: item[DataBaseSqflite.name],
            code: item[DataBaseSqflite.codeItem],
            sale: item[DataBaseSqflite.sale],
            buy: item[DataBaseSqflite.buy],
            quantity: item[DataBaseSqflite.quantity],
            id: item[DataBaseSqflite.id].toString(),
            company: item[DataBaseSqflite.company],
            date: item[DataBaseSqflite.date],
            time: item[DataBaseSqflite.time],
          ),
        )
        .toList();
    items.clear();
    items = newResult;
    update();
  }

  void save() async {
    if (await Permission.storage.request().isGranted) {
      var items = "Shopping list\n"
          "---------------\n";
      var total = 0.0;
      for (var index = 0; index < this.items.length; index++) {
        var element = this.items[index];
        items += "Product No. $index\n"
            "Product Name: ${element.name}\n"
            "Product  Price: ${element.sale}\n"
            "---------------\n";
        try {
          total += int.parse(element.sale);
        } catch (_) {}
      }
      items += "---------------\n\n"
          "Total Summation: $total\n";
      await PdfApi.generateCenteredText(items, nameFile.text);
      Get.dialog(const AlertDialog(
        actions: [CloseButton()],
        content: Text("The receipt is saved in your Downloads folder."),
      ));
    } else {
      await Get.dialog(AlertDialog(
        actions: [
          const CloseButton(),
          TextButton(onPressed: () => permission(), child: const Text("Ok"))
        ],
        content: const Text("Please agree to permission to store files"),
      ));
    }
  }

  permission() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {}

    if (await Permission.storage.isRestricted) {
      // The OS restricts access, for example, because of parental controls.
    }
  }
}

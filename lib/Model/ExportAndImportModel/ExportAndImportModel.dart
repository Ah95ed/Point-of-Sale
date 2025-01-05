import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:point_of_sell/Helper/Log/LogApp.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/DataBaseSqflite.dart';

class ExportAndImportModel {
  late DataBaseSqflite _database;

  ExportAndImportModel() {
    _database = DataBaseSqflite();
  }

  Future<void> exportData(BuildContext context) async {
    await Permission.accessMediaLocation.request();
    // var status = await Permission.storage.request();
    var status = await Permission.manageExternalStorage.request();
     List t = [];
      final data = await _database.getAllData();
      final ls = await data.map((row) {
        t.add(row![DataBaseSqflite.name]);
        t.add(row[DataBaseSqflite.codeItem]);
        t.add(row[DataBaseSqflite.buy]);
        t.add(row[DataBaseSqflite.sale]);
        t.add(row[DataBaseSqflite.quantity]);
        t.add(row[DataBaseSqflite.date]);
        t.add(row[DataBaseSqflite.company]);
        t.add(row[DataBaseSqflite.id]);
        return t.toList();
      }).toList();

    if (status.isGranted) {
      String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

      if (selectedDirectory != null) {
        String filePath = '$selectedDirectory/output.csv';

        // Sample CSV data
        

        String csvString = const ListToCsvConverter().convert(ls);

        // Save CSV to the selected path
        File file = File(filePath);
        await file.writeAsString(csvString).whenComplete(() {
          logSuccess('CSV saved at: $filePath');
        });
        logSuccess('CSV saved at: $filePath');
      } else {
        print('Directory selection canceled.');
      }
    } else {
      logError('Storage permission denied.');
      return;
    }

    

    //   if (ls.isEmpty) {
    //     logWarning('message export empty');
    //     return;
    //   }

    //   String? csvString = const ListToCsvConverter().convert(ls);
    //   Directory directory = await getApplicationDocumentsDirectory();
    // String filePath = '${directory.path}/output.csv';

    // File file = File(filePath);
    // await file.writeAsString(csvString);
    // logSuccess(" Exported to $filePath \n ${file.path}");
    // السماح للمستخدم بتحديد المسار
    // logWarning('message export empty 1');
    // String savePath =
    //     await FilePicker.platform.getDirectoryPath(dialogTitle: 'Hi ') ?? '';
    // logWarning('message export empty 2');
    // // حفظ الملف في المسار الذي اختاره المستخدم
    // File exportFile = File(savePath);
    // await exportFile.writeAsString(savePath).then((f) {
    //   logWarning('message export empty 3 ${f.path}');
    // }).catchError((error) {
    //   logError('message export empty 4');
    // });
  }

  Future<void> importData() async {
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
    final p = await Permission.accessMediaLocation.request();
    if (p.isGranted) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
      );

      if (result != null) {
        File file = File(result.files.single.path!);
        List<String> csvLines = await file.readAsLines();

        for (String element in csvLines) {
          List<String> name = element.split(',');
          List<String> code = element.split(',');
          List<String> buy = element.split(',');
          List<String> sell = element.split(',');
          List<String> quant = element.split(',');
          List<String> date = element.split(',');
          List<String> company = element.split(',');
          List<String> id = element.split(',');
          await _database.insert({
            DataBaseSqflite.name: name[0],
            DataBaseSqflite.codeItem: code[1],
            DataBaseSqflite.buy: buy[2],
            DataBaseSqflite.sale: sell[3],
            DataBaseSqflite.quantity: quant[4],
            DataBaseSqflite.date: date[5],
            DataBaseSqflite.company: company[6],
            DataBaseSqflite.id: id[7],
          });
        }
      }
    }
  }
}

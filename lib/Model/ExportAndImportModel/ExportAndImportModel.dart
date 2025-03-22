import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:point_of_sell/Helper/Log/LogApp.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/DataBaseSqflite.dart';
import 'package:point_of_sell/View/style/SizeApp/DeviceUtils.dart';

class ExportAndImportModel {
  late DataBaseSqflite _database;
  late List<List> ls = [];

  ExportAndImportModel() {
    logSuccess('ExportAndImportModel');
    _database = DataBaseSqflite();
  }

  Future<void> exportData(BuildContext context) async {
        List t = [];
    final data = await _database.getAllData();
       await data.map((row) {
      t.add(row![DataBaseSqflite.name]);
      t.add(row[DataBaseSqflite.codeItem]);
      t.add(row[DataBaseSqflite.buy]);
      t.add(row[DataBaseSqflite.sale]);
      t.add(row[DataBaseSqflite.quantity]);
      t.add(row[DataBaseSqflite.date]);
      t.add(row[DataBaseSqflite.company]);
      t.add(row[DataBaseSqflite.id]);
      t.toList();
    }).toList();
    ls.add(t);
      logError(" == s ${ls}");
    if (DeviceUtils.isDesktop(context)) {
      // await Permission.storage.request();
      // await Permission.manageExternalStorage.request();
      // final p = await Permission.accessMediaLocation.request();
      // await Permission.accessMediaLocation.request();
 String? csvString = const ListToCsvConverter().convert(ls);
        String? outputFile = await FilePicker.platform.saveFile(
        dialogTitle: 'اختر مكان حفظ الملف',
        fileName: 'data.csv',
        type: FileType.custom,
        allowedExtensions: ['csv'],
      );
        final File file = File(outputFile!);
      await file.writeAsString(csvString);

   

    }
  

  

    // await NativeComnucation().runJavaCode({"list": t});

    // logSuccess("message ==== ${result}");
    //
    // String? csvString = const ListToCsvConverter().convert(rows);
    // logSuccess("a1");
    // // Save CSV to the selected path
    // File file = File(Uri.decodeFull(result));
    // logSuccess("${file.path}");
    // if (await file.exists()) {
    //   logSuccess("a3");
    //   await file.writeAsString(csvString).whenComplete(() {
    //     logSuccess('CSV saved at: $file');
    //   });
    //   logSuccess("a4");
    // } else {
    //   logSuccess("a5");
    //   file.create(recursive: true);
    //   logError('CSV Not Saved at: ');
    // }

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

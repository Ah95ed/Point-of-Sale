import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/DataBaseSqflite.dart';

class ExportAndImportModel {
  late DataBaseSqflite _database;

  ExportAndImportModel() {
    _database = DataBaseSqflite();
  }

  Future<void> exportData(BuildContext context) async {
     List t = [];
    final data = await _database.getAllData();
    data.map((row) {
t.add(row![DataBaseSqflite.name]);
t.add(row[DataBaseSqflite.codeItem]);
t.add(row[DataBaseSqflite.buy]);
t.add(row[DataBaseSqflite.sale]);
t.add(row[DataBaseSqflite.date]);
t.add(row[DataBaseSqflite.company]);
t.add(row[DataBaseSqflite.id]);
return t.toList();
    }).toList();
    // .map((row) {
    //   List t = [];
    //   t.add(row.name);
    //   t.add(row.barcode);
    //   t.add(row.cost);
    //   t.add(row.sell);
    //   t.add(row.id);
    //   return t.toList();
    // }).toList();
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
    final p = await Permission.accessMediaLocation.request();

    if (p.isGranted) {
      String? result = await FilePicker.platform.getDirectoryPath();
      if (result != null) {
        final file = File('$result/data.csv');
        String? csvString = const ListToCsvConverter().convert(data.cast<List?>());
        await file
            .writeAsString(csvString)
            .whenComplete(() => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('S.of(context).ExportedisDone')),
                ));
      }
    }
  }
}

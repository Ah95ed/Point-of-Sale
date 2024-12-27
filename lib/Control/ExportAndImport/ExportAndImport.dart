import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:point_of_sell/Model/ExportAndImportModel/ExportAndImportModel.dart';

class ExportAndImportController extends GetxController {
  late final ExportAndImportModel exportAndImportModel;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    exportAndImportModel = ExportAndImportModel();
  }

  Future<void> exportData(BuildContext context) async {
    await exportAndImportModel.exportData(context);
    update();
  }
  Future<void> importData() async {
    await exportAndImportModel.importData();
    update();
  }
}

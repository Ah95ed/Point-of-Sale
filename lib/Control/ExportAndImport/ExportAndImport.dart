import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';
import 'package:point_of_sell/Helper/Log/LogApp.dart';
import 'package:point_of_sell/Model/ExportAndImportModel/ExportAndImportModel.dart';

class ExportAndImportController extends GetxController {
  late final ExportAndImportModel exportAndImportModel;

  

  @override
  void onInit() {
    // TODO: implement onInit
    logSuccess('message ExportAndImportController');
    super.onInit();
    exportAndImportModel = ExportAndImportModel();
  }
  @override void onClose() { 
    // Cleanup code here 
    super.onClose();
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

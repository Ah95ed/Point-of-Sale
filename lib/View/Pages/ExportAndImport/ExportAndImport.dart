import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/ExportAndImport/ExportAndImport.dart';
import 'package:point_of_sell/Helper/Log/LogApp.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';

class ExportAndImport extends StatelessWidget {
  ExportAndImport({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put( ExportAndImportController());
    logInfo('message ExportAndImport');
    return GetBuilder<ExportAndImportController>(
        init: ExportAndImportController(),
        builder: (controller) {
          return Container(
            child: Column(
              spacing: context.getMinSize(50),
              children: [
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    await controller.exportData(context);
                  },
                  child: const Text('Export'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await controller.importData();
                  },
                  child: const Text('Import'),
                ),
                const Spacer(),
              ],
            ),
          );
        });
  }
}

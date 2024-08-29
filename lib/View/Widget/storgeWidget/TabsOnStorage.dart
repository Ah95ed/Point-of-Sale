import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:point_of_sell/Helper/Locale/Language.dart';
import 'package:point_of_sell/View/Widget/TextField.dart';
import 'package:point_of_sell/View/Widget/storgeWidget/storge_additional.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TabsOnStorage extends StatelessWidget {
  const TabsOnStorage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          tabs: [
            Tab(
              text: "additional_data".tr,
            ),
            Tab(
              text: "enter_barcode".tr,
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            AdditinoalData(),
            GenerateCode(),
          ],
        ),
      ),
    );
  }
}

class GenerateCode extends StatefulWidget {
  const GenerateCode({super.key});

  @override
  State<GenerateCode> createState() => _GenerateCodeState();
}

class _GenerateCodeState extends State<GenerateCode> {
  final TextEditingController text = TextEditingController();
  final GlobalKey _globalKey = GlobalKey();
  final GlobalKey _globalKey1 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Row(
        children: [
          SizedBox(
            width: width / 4,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFieldCustom(
                      icons: Icons.qr_code,
                      name: "Enter Text",
                      input: TextInputType.text,
                      text: text,
                    ),
                  ),
                  const SizedBox(
                    height: 18.0,
                  ),
                  SizedBox(
                    width: width / 5,
                    child: OutlinedButton(
                      onPressed: () async {
                        if (text.text.isEmpty) {
                          Get.snackbar('Attention', "The Field is empty");
                          return;
                        }
                        setState(() {});
                      },
                      child: Text('generation'.tr),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: width / 4,
            child: Column(
              children: [
                RepaintBoundary(
                  key: _globalKey1,
                  child: QrImageView(
                    data: text.text,
                    size: 180.0,
                    version: QrVersions.auto,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    onPressed: () async {
                      saveqrorbarcode(_globalKey1, 'qrcode.png');
                    },
                    child: Text('save'.tr),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: width / 4,
            child: Column(
              children: [
                RepaintBoundary(
                  key: _globalKey,
                  child: BarcodeWidget(
                    data: text.text,
                    barcode: Barcode.code128(),
                    width: 200.0,
                    height: 180.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    onPressed: () async {
                      saveqrorbarcode(_globalKey, ' _barcode.png');
                    },
                    child: Text('save'.tr),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> saveqrorbarcode(GlobalKey key, String? type) async {
  await Permission.storage.request();
  await Permission.manageExternalStorage.request();
  final p = await Permission.accessMediaLocation.request();
  if (p.isGranted) {
    String? result = await FilePicker.platform.getDirectoryPath();
    try {
      RenderRepaintBoundary boundary =
          key.currentContext!.findRenderObject() as RenderRepaintBoundary;
      if (boundary.debugNeedsPaint) {
        await Future.delayed(const Duration(milliseconds: 20));
        return saveqrorbarcode(key, type);
      }
      final image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();

      // final directory =
      //     await getApplicationDocumentsDirectory();
      final file = File('$result/$type');
      await file.writeAsBytes(pngBytes);

      // ignore: use_build_context_synchronously
      // Get.snackbar('title', file.path);
      Get.showSnackbar(GetSnackBar(
        title: "Done",
        message: file.path,
        duration: const Duration(seconds: 3),
      ));
    } catch (e) {
      Get.snackbar(
        Language.error,
        e.toString(),
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfApi {
  static Future<File> generateCenteredText(String text, String nameFile) async {
    final pdf = Document();

    pdf.addPage(Page(
      build: (context) => Padding(padding: const EdgeInsets.all(16), child: Center(child: Text(text, style: const TextStyle(fontSize: 32)))),
      pageFormat: PdfPageFormat.undefined,
    ));

    return saveDocument(name: "$nameFile.pdf", pdf: pdf);
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
      final bytes = await pdf.save();
      var download = await getDownloadPath();
      final file = File('$download/$name');

      await file.writeAsBytes(bytes);

      return file;
  }
  static Future<String?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/emulated/0/Download');
        if (!await directory.exists()) directory = await getExternalStorageDirectory();
      }
    } catch (err) {
      print("Cannot get download folder path");
    }
    return directory?.path;
  }
}
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:point_of_sell/Model/Models/Items.dart';
import 'package:printing/printing.dart';

class PdfApi {
  static Future<File> generateCenteredText(String text, String nameFile) async {
    final pdf = Document();

    pdf.addPage(
      Page(
        build:
            (context) => Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Text(text, style: const TextStyle(fontSize: 32)),
              ),
            ),
        pageFormat: PdfPageFormat.undefined,
      ),
    );

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
        if (!await directory.exists())
          directory = await getExternalStorageDirectory();
      }
    } catch (err) {
      print("Cannot get download folder path");
    }
    return directory?.path;
  }

  // دالة إنشاء ملف PDF
  Future<Uint8List> generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);

    // إنشاء صفحة PDF
    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.SizedBox(height: 20),
              pw.Text(
                title,
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                'مثال على إنشاء مستند PDF في تطبيق Flutter'.codeUnits.toString(),
                style: const pw.TextStyle(fontSize: 18),
              ),
              pw.Divider(),
              pw.Text(
                'يمكنك إضافة المزيد من المحتوى هنا',
                style: const pw.TextStyle(fontSize: 14),
              ),
            ],
          );
        },
      ),
    );

    // تحويل المستند إلى Uint8List
    return pdf.save();
  }

  Future<void> savePdf(List<Items> search) async {
   final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: search.map((item) => pw.Text(item.name)).toList(),
        );
      },
    ),
  );
    // String? outputFile = await FilePicker.platform.saveFile(
    //     dialogTitle: 'اختر مكان حفظ الملف',
    //     fileName: 'data.pdf',
    //     type: FileType.custom,
    //     allowedExtensions: ['pdf'],
    //   );
    await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
  }
}

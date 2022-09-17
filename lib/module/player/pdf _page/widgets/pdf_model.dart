import 'dart:io';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class CreatePdf {
  static Document pdfA =pw. Document();
// static Uint8List fontData = File('assets/fonts/OpenSans-Bold.ttf').readAsBytesSync();
// static final data = fontData.buffer.asByteData();

  static convertPdf() async {
   final font = await rootBundle.load("assets/fonts/OpenSans-Bold.ttf");
final ttf = Font.ttf(font);

pdfA.addPage(Page(
    build: (Context context) {
      return Center(
        child: Text('Dart is awesome', style: TextStyle(font: ttf, fontSize: 40)),
      ); // Center
    }));
    savePdf();
  }

  static Future savePdf() async {
    final bytes = await pdfA.save();

    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String documentPath = documentDirectory.path;

    File file = File("$documentPath/example.pdf");

    file.writeAsBytesSync(bytes);
    OpenFile.open('$documentPath/Output.pdf');
  }

}

//   static savePdf(bytes) async {
//     Directory directory = (await getApplicationDocumentsDirectory());
//     String path = directory.path;
//     File file = File('$path/Output.pdf');
//     await file.writeAsBytes(bytes, flush: true);
//     OpenFile.open('$path/Output.pdf');
//   }
// }

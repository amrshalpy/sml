import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ViewPdf extends StatelessWidget {
  const ViewPdf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        build: (format) => _generatePdf(format, 'Pdf view'),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.nunitoExtraLight();
    final image = await imageFromAssetBundle('images/002.png');
    final image1 = await imageFromAssetBundle('images/1.png');
    final leg = await imageFromAssetBundle('images/leg weight.png');
    final lifiting = await imageFromAssetBundle('images/leftting weight.png');
    final jump = await imageFromAssetBundle('images/long jumping di.png');
    final vertical = await imageFromAssetBundle('images/verical jumb.png');
    final qrCode = await imageFromAssetBundle('images/QR (1).png');
    final running = await imageFromAssetBundle('images/Group 23.png');
    final group = await imageFromAssetBundle('images/Group 204.png');
    final image2 = await imageFromAssetBundle('images/Rectangle 474.png');
    final country = await imageFromAssetBundle('images/Path 321.png');
    final weight = await imageFromAssetBundle('images/surface1.png');
    final right = await imageFromAssetBundle('images/roght or left p.png');
    final nationality = await imageFromAssetBundle('images/Path 317.png');
    final city = await imageFromAssetBundle('images/Path 274.png');
    final birthday = await imageFromAssetBundle('images/surface1 (1).png');
    final gender = await imageFromAssetBundle('images/gender.png');
    final height = await imageFromAssetBundle('images/CompositeLayer2.png');
    final netImage = await networkImage(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-IQRS0b8V8qu4j0BMG2G-YJSplMLT7H211Q&usqp=CAU');
    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (pw.Context context) {
          return pw.Stack(children: [
            pw.Container(
              decoration: pw.BoxDecoration(
                  gradient: pw.LinearGradient(colors: [
                PdfColor.fromInt(0xff154E66),
                PdfColor.fromInt(0xff06141A)
              ])),
            ),
            pw.Stack(
              alignment: pw.Alignment.topCenter,
              children: [
                pw.Stack(
                  children: [
                    pw.Container(
                      child: pw.Image(
                        image,
                      ),
                    ),
                    pw.Align(
                      alignment: pw.Alignment.topCenter,
                      child: pw.Padding(
                        padding:
                            pw.EdgeInsets.only(right: 20, left: 90, top: 60),
                        child: pw.Container(
                          // margin: EdgeInsets.only(left: 60),
                          height: 190,
                          width: 190,

                          child: pw.Stack(
                            alignment: pw.Alignment.center,
                            children: [
                              pw.Image(
                                image2,
                              ),
                              pw.Container(
                                  // margin: EdgeInsets.only(left: 60),
                                  height: 100,
                                  width: 90,
                                  child: pw.Image(netImage)),
                            ],
                          ),
                        ),
                      ),
                    ),

// widget right
                    pw.Padding(
                      padding: pw.EdgeInsets.only(left: 340, top: 240),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Container(
                            height: 60,
                            width: 60,
                            child: pw.Image(group),
                          ),
                          pw.SizedBox(
                            height: 9,
                          ),
                          pw.Align(
                            alignment: pw.Alignment.topCenter,
                            child: pw.Text(
                              'Performance',
                              style: pw.TextStyle(
                                  color: PdfColors.orange,
                                  fontSize: 17,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          ),
                          pw.SizedBox(
                            height: 7,
                          ),
                          pw.Row(
                            children: [
                              pw.Image(
                                running,
                                height: 20,
                                width: 20,
                              ),
                              pw.SizedBox(
                                width: 5,
                              ),
                              pw.Text(
                                'Running time',
                                style: pw.TextStyle(
                                  color: PdfColors.yellowAccent,
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          pw.SizedBox(
                            height: 4,
                          ),
                          pw.Text(
                            '--/--',
                            style: pw.TextStyle(
                              color: PdfColors.white,
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.SizedBox(
                            height: 4,
                          ),
                          pw.Row(
                            children: [
                              pw.Image(
                                vertical,
                                height: 20,
                                width: 20,
                              ),
                              pw.SizedBox(
                                width: 5,
                              ),
                              pw.Text(
                                'Vertical jumbing',
                                style: pw.TextStyle(
                                  color: PdfColors.yellowAccent,
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          pw.SizedBox(
                            height: 3,
                          ),
                          pw.Text(
                            '--/--',
                            style: pw.TextStyle(
                              color: PdfColors.white,
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.SizedBox(
                            height: 3,
                          ),
                          pw.Row(
                            children: [
                              pw.Image(
                                jump,
                                height: 20,
                                width: 20,
                              ),
                              pw.SizedBox(
                                width: 5,
                              ),
                              pw.Text(
                                'Long jumbing',
                                style: pw.TextStyle(
                                  color: PdfColors.yellowAccent,
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          pw.SizedBox(
                            height: 3,
                          ),
                          pw.Text(
                            '--/--',
                            style: pw.TextStyle(
                              color: PdfColors.white,
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Row(
                            children: [
                              pw.Image(
                                lifiting,
                                height: 20,
                                width: 20,
                              ),
                              pw.SizedBox(
                                width: 5,
                              ),
                              pw.Text(
                                'Lifiting Weights',
                                style: pw.TextStyle(
                                  color: PdfColors.white,
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          pw.SizedBox(
                            height: 3,
                          ),
                          pw.Text(
                            '--/--',
                            style: pw.TextStyle(
                              color: PdfColors.white,
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Row(
                            children: [
                              pw.Image(
                                leg,
                                height: 20,
                                width: 20,
                              ),
                              pw.SizedBox(
                                width: 5,
                              ),
                              pw.Text(
                                'Leg Weights',
                                style: pw.TextStyle(
                                  color: PdfColors.white,
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          pw.SizedBox(
                            height: 3,
                          ),
                          pw.Text(
                            '--/--',
                            style: pw.TextStyle(
                              color: PdfColors.white,
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Padding(
                        padding: pw.EdgeInsets.only(right: 70),
                        child: pw.Stack(
                          alignment: pw.Alignment.center,
                          children: [
                            pw.Container(
                                width: 250,
                                height: 170,
                                child: pw.Image(image1)),
                            pw.Padding(
                              padding:
                                  pw.EdgeInsets.only(right: 50, bottom: 10),
                              child: pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                children: [
                                  pw.Text(
                                    'playerName',
                                    style: pw.TextStyle(
                                      font: font,
                                      fontSize: 16,
                                      color: PdfColors.white,
                                      fontWeight: pw.FontWeight.normal,
                                    ),
                                  ),
                                  pw.Text('playerName',
                                      style: pw.TextStyle(
                                        font: font,
                                        fontSize: 16,
                                        color: PdfColors.white,
                                        fontWeight: pw.FontWeight.normal,
                                      )),
                                ],
                              ),
                            )
                          ],
                        )),
                    pw.SizedBox(
                      height: 2,
                    ),
                    // widgetLeft!,
                    pw.Padding(
                      padding:
                          pw.EdgeInsets.only(left: 20, top: 120, right: 130),
                      child: pw.Padding(
                        padding: pw.EdgeInsets.only(left: 10, right: 210),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                children: [
                                  pw.Row(
                                    children: [
                                      pw.Image(
                                        nationality,
                                        height: 20,
                                        width: 20,
                                      ),
                                      pw.SizedBox(
                                        width: 5,
                                      ),
                                      pw.Text('nationality',
                                          style: pw.TextStyle(
                                            color: PdfColors.yellowAccent,
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.bold,
                                          )),
                                    ],
                                  ),
                                  pw.SizedBox(
                                    height: 3,
                                  ),
                                  pw.Text('--/--',
                                      style: pw.TextStyle(
                                        color: PdfColors.yellowAccent,
                                        fontSize: 12,
                                        fontWeight: pw.FontWeight.bold,
                                      )),
                                  pw.SizedBox(
                                    height: 3,
                                  ),
                                  pw.Row(
                                    children: [
                                      pw.Image(
                                        country,
                                        height: 20,
                                        width: 20,
                                      ),
                                      pw.SizedBox(
                                        width: 5,
                                      ),
                                      pw.Text('country',
                                          style: pw.TextStyle(
                                            color: PdfColors.yellowAccent,
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.bold,
                                          )),
                                    ],
                                  ),
                                  pw.SizedBox(
                                    height: 3,
                                  ),
                                  pw.Text('--/--',
                                      style: pw.TextStyle(
                                        color: PdfColors.yellowAccent,
                                        fontSize: 12,
                                        fontWeight: pw.FontWeight.bold,
                                      )),
                                  pw.SizedBox(
                                    height: 3,
                                  ),
                                  pw.Row(
                                    children: [
                                      pw.Image(
                                        city,
                                        height: 20,
                                        width: 20,
                                      ),
                                      pw.SizedBox(
                                        width: 5,
                                      ),
                                      pw.Text('City',
                                          style: pw.TextStyle(
                                            color: PdfColors.yellowAccent,
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.bold,
                                          )),
                                    ],
                                  ),
                                  pw.SizedBox(height: 4),
                                  pw.Text('Alex',
                                      style: pw.TextStyle(
                                        color: PdfColors.yellowAccent,
                                        fontSize: 12,
                                        fontWeight: pw.FontWeight.bold,
                                      )),
                                  pw.SizedBox(height: 3),
                                  pw.Row(
                                    children: [
                                      pw.Image(
                                        birthday,
                                        height: 20,
                                        width: 20,
                                      ),
                                      pw.SizedBox(
                                        width: 5,
                                      ),
                                      pw.Text('birthday',
                                          style: pw.TextStyle(
                                            color: PdfColors.yellowAccent,
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.bold,
                                          )),
                                    ],
                                  ),
                                  pw.SizedBox(height: 3),
                                  pw.Text('--/--',
                                      style: pw.TextStyle(
                                        color: PdfColors.yellowAccent,
                                        fontSize: 12,
                                        fontWeight: pw.FontWeight.bold,
                                      )),
                                  pw.SizedBox(height: 8),
                                ]),
                            pw.Text('Physical properties',
                                style: pw.TextStyle(
                                  color: PdfColors.yellowAccent,
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.bold,
                                )),
                            pw.SizedBox(height: 7),
                            pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.center,
                              children: [
                                pw.Row(
                                  children: [
                                    pw.Image(
                                      gender,
                                      height: 20,
                                      width: 20,
                                    ),
                                    pw.SizedBox(
                                      width: 5,
                                    ),
                                    pw.Text('Gender',
                                        style: pw.TextStyle(
                                          color: PdfColors.yellowAccent,
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.bold,
                                        )),
                                  ],
                                ),
                                pw.SizedBox(height: 3),
                                pw.Text(' --/--',
                                    style: pw.TextStyle(
                                      color: PdfColors.yellowAccent,
                                      fontSize: 12,
                                      fontWeight: pw.FontWeight.bold,
                                    )),
                                pw.SizedBox(height: 3),
                                pw.Row(
                                  children: [
                                    pw.Image(
                                      weight,
                                      height: 20,
                                      width: 20,
                                    ),
                                    pw.SizedBox(
                                      width: 5,
                                    ),
                                    pw.Text('Weight',
                                        style: pw.TextStyle(
                                          color: PdfColors.yellowAccent,
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.bold,
                                        )),
                                  ],
                                ),
                                pw.SizedBox(height: 3),
                                pw.Text('--/--',
                                    style: pw.TextStyle(
                                      color: PdfColors.yellowAccent,
                                      fontSize: 12,
                                      fontWeight: pw.FontWeight.bold,
                                    )),
                                pw.SizedBox(height: 3),
                                pw.Row(
                                  children: [
                                    pw.Image(
                                      height,
                                      height: 20,
                                      width: 20,
                                    ),
                                    pw.SizedBox(
                                      width: 5,
                                    ),
                                    pw.Text('Height',
                                        style: pw.TextStyle(
                                          color: PdfColors.yellowAccent,
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.bold,
                                        )),
                                  ],
                                ),
                                pw.SizedBox(height: 3),
                                pw.Text('--/--',
                                    style: pw.TextStyle(
                                      color: PdfColors.yellowAccent,
                                      fontSize: 12,
                                      fontWeight: pw.FontWeight.bold,
                                    )),
                                pw.SizedBox(height: 3),
                              ],
                            ),
                            pw.Row(
                              children: [
                                pw.Image(
                                  right,
                                  height: 20,
                                  width: 20,
                                ),
                                pw.SizedBox(
                                  width: 5,
                                ),
                                pw.Text('Right or left',
                                    style: pw.TextStyle(
                                      color: PdfColors.yellowAccent,
                                      fontSize: 12,
                                      fontWeight: pw.FontWeight.bold,
                                    ))
                              ],
                            ),
                            pw.SizedBox(
                              height: 3,
                            ),
                            pw.Text('--/--',
                                style: pw.TextStyle(
                                  color: PdfColors.yellowAccent,
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.bold,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ]);
        },
      ),
    );

    return pdf.save();
  }
}

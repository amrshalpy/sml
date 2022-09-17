import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sportive/componant/componant/componant.dart';
// import 'package:qrscan/qrscan.dart' as scanner;

class QrCode extends StatefulWidget {
  const QrCode({Key? key}) : super(key: key);

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  String data = 'hello amr mohamed shalpy n,kkopo';
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Container(
          child:
          Column(
            children: [
              Center(
                child: Image.asset('images/Group 204.png',
                height: 120,
                width: 120,
                )
                ),
              
               Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                greenButton(txt: 'share', onPress: () {}),
                greenButton(txt: 'Scan', onPress: () {}),
              ],
            )
              // result == null
              //     ? Container(
              //         height: 190,
              //         child: QRView(
              //           key: qrKey,
              //           onQRViewCreated: _onQRViewCreated,
              //         ),
              //       )
              //     : Center(
              //         child: (result != null)
              //             ?Stack(
              //             alignment: AlignmentDirectional.center,
              //             children: [
              //               Image.asset('images/gold5.png',
              //                   fit: BoxFit.contain, width: 170, height: 220),
              //               Column(
              //                 children: [
              //                   Row(
              //                     mainAxisAlignment: MainAxisAlignment.center,
              //                     children: [
              //                       Column(
              //                         mainAxisAlignment:
              //                             MainAxisAlignment.start,
              //                         crossAxisAlignment:
              //                             CrossAxisAlignment.start,
              //                         children: [
              //                           Image.asset(
              //                             'images/CompositeLayer (2).png',
              //                             height: 20,
              //                             width: 20,
              //                             // fit: BoxFit.contain,
              //                           ),
              //                           Image.asset(
              //                             'images/CompositeLayer.png',
              //                             height: 20,
              //                             width: 20,
              //                             fit: BoxFit.contain,
              //                           ),
              //                           defaultText(txt: '100 ' + "K"),
              //                           SizedBox(
              //                             height: 1,
              //                           ),
              //                           Icon(Icons.favorite),
              //                           defaultText(txt: '100 ' + "K"),
              //                           SizedBox(
              //                             height: 1,
              //                           ),
              //                           Image.asset(
              //                             'images/icons8-share-48 (3).png',
              //                             height: 20,
              //                             width: 20,
              //                           ),
              //                           defaultText(txt: '100 ' + "K"),
              //                         ],
              //                       ),
              //                       SizedBox(
              //                         width: 10,
              //                       ),
              //                       Column(
              //                         children: [
              //                           Padding(
              //                             padding:
              //                                 const EdgeInsets.only(top: 1),
              //                             child: Container(
              //                               height: 60,
              //                               width: 50,
              //                               decoration: BoxDecoration(
              //                                 image: DecorationImage(
              //                                     fit: BoxFit.cover,
              //                                     image: AssetImage(
              //                                         'images/13.png')),
              //                                 border: Border.all(
              //                                   color: Color.fromARGB(
              //                                       255, 39, 3, 3),
              //                                 ),
              //                                 shape: BoxShape.rectangle,
              //                                 borderRadius:
              //                                     BorderRadius.circular(10),
              //                               ),
              //                             ),
              //                           ),
              //                           SizedBox(
              //                             height: 1,
              //                           ),
              //                         ],
              //                       ),
              //                     ],
              //                   ),
              //                   Container(
              //                       child: defaultText(
              //                           txt: 'football player',
              //                           color: Colors.blueAccent)),
              //                   SizedBox(
              //                     height: 1,
              //                   ),
              //                   Container(
              //                     child: defaultText(
              //                       txt: 'Gool keeper',
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           )
                     
              //             : Text('Scan a code'),
              //       ),
             
             
              // Expanded(
              //   flex: 1,
              //   child: Center(
              //     child: (result != null)
              //         ? Stack(
              //             alignment: AlignmentDirectional.center,
              //             children: [
              //               Image.asset(
              //                 'images/gold5.png',
              //               ),
              //               Column(
              //                 children: [
              //                   Text("name :" + "amr mohamed"),
              //                   Text("name :" + "amr mohamed"),
              //                   Text("name :" + "amr mohamed"),
              //                   Text("name :" + "amr mohamed"),
              //                 ],
              //               )
              //             ],
              //           )
              //         : Text('Scan a code'),
              //   ),
              // )
            ],
          ),
          //  Column(
          //   children: [
          //     // Center(
          //     //   child: QrImage(
          //     //     data: data,
          //     //     version: QrVersions.auto,
          //     //     size: 200.0,
          //     //     // backgroundColor: Colors.blue,
          //     //     embeddedImage: AssetImage('images/sportıve ıcon (1).png'),
          //     //     dataModuleStyle: QrDataModuleStyle(
          //     //         dataModuleShape: QrDataModuleShape.square),
          //     //     foregroundColor: Colors.blue,
          //     //   ),
          //     // ),
          //     // // ElevatedButton(onPressed: () {}, child: Text('scan')),
          //     SizedBox(
          //       height: 20,
          //     ),
          //     greenButton(txt: 'share', onPress: (){})
          //     // result == null
          //     //     ? Container(
          //     //         height: 190,
          //     //         child: QRView(
          //     //           key: qrKey,
          //     //           onQRViewCreated: _onQRViewCreated,
          //     //         ),
          //     //       )
          //     //     : Center(
          //     //         child: (result != null)
          //     //             ?Stack(
          //     //             alignment: AlignmentDirectional.center,
          //     //             children: [
          //     //               Image.asset('images/gold5.png',
          //     //                   fit: BoxFit.contain, width: 170, height: 220),
          //     //               Column(
          //     //                 children: [
          //     //                   Row(
          //     //                     mainAxisAlignment: MainAxisAlignment.center,
          //     //                     children: [
          //     //                       Column(
          //     //                         mainAxisAlignment:
          //     //                             MainAxisAlignment.start,
          //     //                         crossAxisAlignment:
          //     //                             CrossAxisAlignment.start,
          //     //                         children: [
          //     //                           Image.asset(
          //     //                             'images/CompositeLayer (2).png',
          //     //                             height: 20,
          //     //                             width: 20,
          //     //                             // fit: BoxFit.contain,
          //     //                           ),
          //     //                           Image.asset(
          //     //                             'images/CompositeLayer.png',
          //     //                             height: 20,
          //     //                             width: 20,
          //     //                             fit: BoxFit.contain,
          //     //                           ),
          //     //                           defaultText(txt: '100 ' + "K"),
          //     //                           SizedBox(
          //     //                             height: 1,
          //     //                           ),
          //     //                           Icon(Icons.favorite),
          //     //                           defaultText(txt: '100 ' + "K"),
          //     //                           SizedBox(
          //     //                             height: 1,
          //     //                           ),
          //     //                           Image.asset(
          //     //                             'images/icons8-share-48 (3).png',
          //     //                             height: 20,
          //     //                             width: 20,
          //     //                           ),
          //     //                           defaultText(txt: '100 ' + "K"),
          //     //                         ],
          //     //                       ),
          //     //                       SizedBox(
          //     //                         width: 10,
          //     //                       ),
          //     //                       Column(
          //     //                         children: [
          //     //                           Padding(
          //     //                             padding:
          //     //                                 const EdgeInsets.only(top: 1),
          //     //                             child: Container(
          //     //                               height: 60,
          //     //                               width: 50,
          //     //                               decoration: BoxDecoration(
          //     //                                 image: DecorationImage(
          //     //                                     fit: BoxFit.cover,
          //     //                                     image: AssetImage(
          //     //                                         'images/13.png')),
          //     //                                 border: Border.all(
          //     //                                   color: Color.fromARGB(
          //     //                                       255, 39, 3, 3),
          //     //                                 ),
          //     //                                 shape: BoxShape.rectangle,
          //     //                                 borderRadius:
          //     //                                     BorderRadius.circular(10),
          //     //                               ),
          //     //                             ),
          //     //                           ),
          //     //                           SizedBox(
          //     //                             height: 1,
          //     //                           ),
          //     //                         ],
          //     //                       ),
          //     //                     ],
          //     //                   ),
          //     //                   Container(
          //     //                       child: defaultText(
          //     //                           txt: 'football player',
          //     //                           color: Colors.blueAccent)),
          //     //                   SizedBox(
          //     //                     height: 1,
          //     //                   ),
          //     //                   Container(
          //     //                     child: defaultText(
          //     //                       txt: 'Gool keeper',
          //     //                     ),
          //     //                   ),
          //     //                 ],
          //     //               ),
          //     //             ],
          //     //           )
                     
          //     //             : Text('Scan a code'),
          //     //       ),
             
             
          //     // Expanded(
          //     //   flex: 1,
          //     //   child: Center(
          //     //     child: (result != null)
          //     //         ? Stack(
          //     //             alignment: AlignmentDirectional.center,
          //     //             children: [
          //     //               Image.asset(
          //     //                 'images/gold5.png',
          //     //               ),
          //     //               Column(
          //     //                 children: [
          //     //                   Text("name :" + "amr mohamed"),
          //     //                   Text("name :" + "amr mohamed"),
          //     //                   Text("name :" + "amr mohamed"),
          //     //                   Text("name :" + "amr mohamed"),
          //     //                 ],
          //     //               )
          //     //             ],
          //     //           )
          //     //         : Text('Scan a code'),
          //     //   ),
          //     // )
          //   ],
          // ),
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void scan() async {}
}

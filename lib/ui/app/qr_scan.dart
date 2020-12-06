// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// class QRScanMethod extends StatefulWidget {
//   @override
//   _QRScanMethodState createState() => _QRScanMethodState();
// }

// class _QRScanMethodState extends State<QRScanMethod> {
//   final GlobalKey qrKey = GlobalKey();
//   String barcode = "";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           QRView(
//             key: qrKey,
//             onQRViewCreated: (controller) {
//               controller.scannedDataStream.listen((value) {
//                 setState(() {
//                   barcode = value;
//                 });
//               });
//             },
//           ),
//           Text('$barcode')
//         ],
//       ),
//     );
//   }
// }

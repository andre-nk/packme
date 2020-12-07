import 'package:flutter/material.dart';

class QRScanMethod extends StatefulWidget {
  @override
  _QRScanMethodState createState() => _QRScanMethodState();
}

class _QRScanMethodState extends State<QRScanMethod> {
  final GlobalKey qrKey = GlobalKey();
  String barcode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('$barcode')
        ],
      ),
    );
  }
}

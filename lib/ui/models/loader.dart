import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 100,
        color: HexColor('#ECFBF4'),
        child: Center(
            child:
                SpinKitSquareCircle(color: HexColor('#FF8787'), size: 50.0)));
  }
}

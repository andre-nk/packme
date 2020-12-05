// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/signup', (Route<dynamic> route) => false);

    // Navigator.of(context).push(
    //   MaterialPageRoute(builder: (_) => Login()),
    // );
  }

  // ignore: unused_element
  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.jpg', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 18.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      titlePadding: EdgeInsets.fromLTRB(0, 50, 0, 0),
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Pinjam packaging kami",
          body:
              "setiap kali kamu take-away. Dijamin steril dan berkualitas! Bisa dari ojek online kok!",
          // image: _buildImage('Ellipse2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Kembalikan packaging kami",
          body:
              "Dengan penjemputan oleh driver ataupun kembalikan sendiri ke stand kami",
          // image: _buildImage('img2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Dapatkan saldo sampai Rp3.000!",
          body: "untuk setiap pengembalian satu packaging dengan utuh",
          // image: _buildImage('img3'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Tarik saldo kamu!",
          body: "Ke rekening yang kamu inginkan. Kami sediakan banyak lho!",
          // image: _buildImage('img3'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Selamat kamu telah mengurangi sampah plastik",
          body: "Udah dapat uang, bisa ngurangin sampah plastik lagi! ",
          // image: _buildImage('img3'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      done: const Text('Lanjut', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(8.0, 8.0),
        color: Color(0xFF43D1A5),
        activeColor: Color(0xFFFF8787),
        activeSize: Size(30.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}

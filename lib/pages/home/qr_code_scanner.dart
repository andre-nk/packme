part of "../pages.dart";

class QRViewExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.

  @override
  Widget build(BuildContext context) {

    if(result != null){
      print(result!.code);
      if(result!.code == "PMS-CLDmHNKAXj"){
        Get.Get.to(() => RentPackConfirmation());
      }
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: MQuery.height(0.1, context),
        margin: EdgeInsets.only(
          top: MQuery.height(0.025, context)
        ),
        padding: EdgeInsets.only(
          bottom: MQuery.height(0.025, context)
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: FloatingActionButton(
                  backgroundColor: Palette.pinkAccent,
                  elevation: 5,
                  child: Icon(Icons.flash_auto, color: Colors.white),
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  onPressed: () async {
                    await controller?.toggleFlash();
                    setState(() {});
                  },
                ),
              ),
              SizedBox(width: MQuery.width(0.06, context)),
              FittedBox(
                child: FloatingActionButton(
                  backgroundColor: Palette.pinkAccent,
                  elevation: 5,
                  child: Icon(Icons.camera_front, color: Colors.white),
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  onPressed: () async {
                    await controller?.flipCamera();
                    setState(() {});
                  },
                ),
              )
            ]
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Expanded(
            flex: 4, child: _buildQrView(context)
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
          MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Palette.greenAccent,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
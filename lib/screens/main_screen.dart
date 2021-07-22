import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_wifi_share/constants.dart';
import 'package:qr_wifi_share/screens/generate_qr_screen.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_wifi_share/my_toast.dart';
import 'package:wifi_iot/wifi_iot.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => MyHomeState();
}

class MyHomeState extends State<MyHome> {
  String scanBarcode = "unknown";
  CustomToast toast = new CustomToast();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "QR Wifi Share",
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
          body: Container(
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(vertical: 25)),
                    Image.asset(
                      'assets/wifi.png',
                      width: 160,
                      height: 160,
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 30)),
                    Text(
                      "Welcome to QR Wifi Share",
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: textColor,
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 60)),
                    SizedBox(
                      width: defaultWidthButton,
                      height: defaultHeightButton,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: firstColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: secondaryColor)),
                        ),
                        child: Text(
                          'Escanear QR',
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: textColor,
                          ),
                        ),
                        onPressed: () => scanQR(),
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                    SizedBox(
                      width: defaultWidthButton,
                      height: defaultHeightButton,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: firstColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: secondaryColor)),
                        ),
                        child: Text(
                          'Generar QR',
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: textColor,
                          ),
                        ),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GenerateQRWifi(),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 25)),
                    Text(scanBarcode),
                  ],
                ),
              ],
            ),
          ),
        ),
        theme: ThemeData.dark());
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      setState(() {
        this.scanBarcode = barcodeScanRes;
      });
      startConection(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  void startConection(String data) async {
    List<String> credentials = data.split(",");
    var isConnected = await WiFiForIoTPlugin.connect(credentials[0],
        security: NetworkSecurity.WPA, password: credentials[1]);

    if (isConnected) {
      toast.toastInfo("Se ha conectado exitosamente a la red");
    }
  }
}

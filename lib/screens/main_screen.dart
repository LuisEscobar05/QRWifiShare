import 'package:flutter/material.dart';
import 'package:qr_wifi_share/constants.dart';
import 'package:qr_wifi_share/screens/generate_qr_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:MyHome(),
      theme: ThemeData.dark(),
    );
  }
  
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "QR Wifi Share",
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              // fontSize: 20,
              color: textColor,
            ),
          ),
        ),
        body: Container(
          // alignment: Alignment.center,
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
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
                      onPressed: () {},
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
                ],
              ),
            ],
          ),
        ),
        // theme: ThemeData.dark()

      );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qr_wifi_share/constants.dart';

class GenerateQRWifi extends StatefulWidget {
  @override
  MyHomeState createState() => MyHomeState();
}

class MyHomeState extends State<GenerateQRWifi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Scan QR wifi",
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                // fontSize: 20,
                color: textColor,
              ),
            ),
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back_outlined),
              onPressed: () =>
                  Navigator.of(context).pop(), // se usa pop para regresar
            ),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 12)),
                Text(
                  "Escriba la informacion de la red,",
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: textColor,
                  ),
                ),
                Text(
                  "Para poder generar el codigo QR",
                  style: new TextStyle(
                    color: textColor,
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 20)), // 1/6
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: secondaryColor,
                    labelText: "SSID",
                    labelStyle: new TextStyle(
                      color: textColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 4)), // 1/6
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: secondaryColor,
                    // hintText: "PASSWORD",
                    labelText: "PASSWORD",
                    labelStyle: new TextStyle(
                      color: textColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 15)), // 1/6
                InkWell(
                  child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: SizedBox(
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
                      )),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 25)),
                Image.asset(
                  'assets/qr.png',
                  width: 120,
                  height: 120,
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                InkWell(
                  onTap: (){},
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Guardar QR",
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: textColor,
                      ),
                    ),
                )),
              ],
            ),
          )),
      theme: ThemeData.dark(),
    );
  }
}

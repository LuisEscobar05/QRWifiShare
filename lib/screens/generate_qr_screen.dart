// import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_wifi_share/constants.dart';
// import 'package:flutter/services.dart';
// import 'dart:async';
// import 'dart:typed_data';
//  import 'dart:ui' as ui;
// import 'package:path_provider/path_provider.dart';
import 'package:flutter/rendering.dart';

class GenerateQRWifi extends StatefulWidget {
  @override
  MyHomeState createState() => MyHomeState();
}

class MyHomeState extends State<GenerateQRWifi> {
  String _dataString = "QR Wifi Shared";
  final _ssid = TextEditingController();
  final _password = TextEditingController();
  GlobalKey _globalKey = new GlobalKey();

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
                  controller: _ssid,
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 4)), // 1/6
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: secondaryColor,
                    labelText: "PASSWORD",
                    labelStyle: new TextStyle(
                      color: textColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  controller: _password,
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
                          onPressed: () => changeStateQR(),
                        ),
                      )),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 25)),
                InkWell(
                  child: Center(
                    child: RepaintBoundary(
                      key: _globalKey,
                      child:QrImage(
                            data: _dataString,
                            size: 200,
                            errorStateBuilder: (cxt, err) {
                              return Container(
                                child: Center(
                                  child: Text(
                                    "Uh oh! Something went wrong...",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            }) ,
                    ),

                )),
                Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                InkWell(
                    onTap: () => {},
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

  void changeStateQR() {
    String fullInformation = _ssid.text + "," + _password.text;
    setState(() {
      this._dataString = fullInformation;
    });
  }




  
}

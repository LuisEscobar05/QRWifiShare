import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  CustomToast();
  void toastInfo(String info) {
    Fluttertoast.showToast(msg: info, toastLength: Toast.LENGTH_LONG);
  }
}
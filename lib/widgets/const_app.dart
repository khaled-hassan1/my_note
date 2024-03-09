import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class ConstApp {
  static void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
        // Fluttertoast.cancel();

  }

  static TextStyle textTitle =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white);
  static List<String> names=['محمد علي آيوب','محمد آبو الخير'];
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMessageHelper {
  static void showToast(String msg, Color bgColor) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: bgColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void showSuccess(String message) {
    showToast(
      message,
      Colors.green,
    );
  }
  static void showError(String message) {
    showToast(
      message,
      Colors.red,
    );
  }
  static void showInfo(String message) {
    showToast(
      message,
      Colors.blue,
    );
  }
}

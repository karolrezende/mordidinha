import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showCustomToast({
  required String message,
  required Color backgroundColor,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP, // Aparece no topo
    backgroundColor: backgroundColor, // Parametriza a cor do fundo
    textColor: Colors.white,
    fontSize: 20.0,
  );
}

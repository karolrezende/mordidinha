import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle lgboldTextStyle() {
    return TextStyle(
      color: Colors.pink,
      fontSize: 24,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle mdBoldTextStyle() {
    return TextStyle(
      color: Colors.pink,
      fontSize: 20,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle mdLightTextStyle() {
    return TextStyle(
      color: const Color.fromARGB(161, 233, 30, 98),
      fontSize: 20,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle smBoldTextStyle() {
    return TextStyle(
      color: Colors.pink,
      fontSize: 16,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle smLightTextStyle() {
    return TextStyle(
      color: const Color.fromARGB(161, 233, 30, 98),
      fontSize: 16,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
  }
}

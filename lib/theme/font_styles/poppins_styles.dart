import 'package:flutter/material.dart';

class PoppinsStyles {
  TextStyle boldPoppins() {
    return const TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        letterSpacing: 1);
  }

  lightBold() {
    return const TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 23,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        letterSpacing: 1);
  }

  regularText() {
    return const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.normal,
        letterSpacing: 1);
  }

  smallInfo() {
    return const TextStyle(
        color: Colors.black26,
        fontSize: 12,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.normal,
        letterSpacing: 1);
  }
}

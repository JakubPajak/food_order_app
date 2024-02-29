import 'package:flutter/material.dart';

class AntStyler {
  TextStyle headingStyle() {
    return const TextStyle(
        color: Colors.black,
        fontFamily: 'Anta',
        fontSize: 40,
        letterSpacing: 4);
  }

  h1Style() {
    return const TextStyle(
        color: Colors.black,
        fontFamily: 'Anta',
        fontSize: 30,
        letterSpacing: 2);
  }

  h2Style() {
    return const TextStyle(
        color: Colors.black,
        fontFamily: 'Anta',
        fontSize: 20,
        letterSpacing: 2);
  }
}

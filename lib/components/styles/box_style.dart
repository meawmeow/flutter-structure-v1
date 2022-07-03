import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

class BoxStyle {
  static const boxDecorationHeader = BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.blueAccent, Colors.lightBlueAccent],
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    ),
  );

  static final boxDecorationType1 = BoxDecoration(
    gradient: const LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [
        Colors.orange,
        Colors.amber,
      ],
    ),
    boxShadow: [
      BoxShadow(
          color: Colors.black.withAlpha(60),
          blurRadius: 5,
          offset: const Offset(0, 8),
          spreadRadius: 2)
    ],
  );

  static final boxDecorationType2 = BoxDecoration(
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment(-0.4, -0.8),
      stops: [0.0, 0.5, 0.5, 1],
      colors: [
        Colors.blue,
        Colors.lightBlueAccent,
        Colors.yellowAccent,
        Colors.orange,
      ],
      tileMode: TileMode.repeated,
    ),
    boxShadow: [
      BoxShadow(
          color: Colors.black.withAlpha(60),
          blurRadius: 5,
          offset: const Offset(0, 8),
          spreadRadius: 2)
    ],
  );

  static final boxDecorationType3 = (color) => BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(0)),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              const Color(0xFFFF0064),
              const Color(0xFFFF7600),
              const Color(0xFFFFD500),
              const Color(0xFF8CFE00),
              const Color(0xFF00E86C),
              const Color(0xFF00F4F2),
              const Color(0xFF00CCFF),
              const Color(0xFF70A2FF),
              const Color(0xFFA96CFF),
            ],
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withAlpha(60),
                blurRadius: 5,
                offset: const Offset(0, 8),
                spreadRadius: 2)
          ]);
}

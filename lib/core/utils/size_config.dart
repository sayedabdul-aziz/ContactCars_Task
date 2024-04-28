import 'package:flutter/material.dart';

class SizeConfig {
  SizeConfig._();
  static MediaQueryData? _mediaQueryData;
  static late double screenW;
  static late double screenH;
  static late double blockH;
  static late double blockV;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenW = _mediaQueryData!.size.width;
    screenH = _mediaQueryData!.size.height;
  }
}

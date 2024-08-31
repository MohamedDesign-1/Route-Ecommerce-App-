
import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontConstants.fontFamily,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle getLightStyle({double fontSize = FontSizeManager.s12, required Color color}) {
  return getTextStyle(fontSize , FontWeightManager.light, color);
}


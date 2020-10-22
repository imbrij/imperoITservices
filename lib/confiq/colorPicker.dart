import 'package:flutter/cupertino.dart';

class ColorPicker {
  Color getColorFromHex(String hexColor) {
    if (hexColor.length >= 6) {
      hexColor = hexColor.replaceAll("#", "");
      if (hexColor.length == 6) {
        hexColor = "FF" + hexColor;
      }
      if (hexColor.length == 8) {
        try {
          return Color(int.parse("0x$hexColor"));
        } catch (error, stacktrace) {
          print("Exception occur: $error stackTrace: $stacktrace");
        }
      }
    }
  }
}

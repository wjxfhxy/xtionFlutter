import 'package:flutter/material.dart';

class ColorExtern {

  static Color tryParse(String s) {
    // 如果传入的十六进制颜色值不符合要求，返回默认值
    if (s == null || s.length != 7 || int.tryParse(s.substring(1, 7), radix: 16) == null) {
      return null;
    }

    return new Color(int.parse(s.substring(1, 7), radix: 16) + 0xFF000000);
  }
}

import 'package:flutter/material.dart';

class TextAlignDesc {

  var _rawValue = "";
  TextAlign _defalueValue;
  TextAlign get defaultValue => _defalueValue;

  TextAlign get alignValue {

    if(_rawValue != null) {
      switch(_rawValue) {
        case "center": return TextAlign.center;
        case "left": return TextAlign.left;
        case "right": return TextAlign.right;
      }
    }

    return defaultValue;
  }

  TextAlignDesc(dynamic desc, [this._defalueValue]) {

    _rawValue = desc as String ?? "";
  }

  TextAlignDesc.defalutValue(this._defalueValue);
}
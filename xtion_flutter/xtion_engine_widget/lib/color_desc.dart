
import 'package:flutter/material.dart';

import 'package:xtion_misc/Color.dart';

class ColorDesc {

  var _rawValue = "";
  Color _defaultValue;
  Color get defalutValue => _defaultValue;

  ColorDesc(dynamic desc, [this._defaultValue]) {

    _rawValue = desc as String ?? "";
  }

  ColorDesc.defaultValue(this._defaultValue);


  bool get isNotEmpty {

    return _rawValue.isNotEmpty;
  }

  bool get isEmpty {

    return _rawValue.isEmpty;
  }

  Color get colorValue {

    return ColorExtern.tryParse(_rawValue) ?? _defaultValue ?? null;
  }
}
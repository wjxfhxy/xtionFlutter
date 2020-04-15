
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:xtion_engine_widget/number_desc.dart';

class SizeDesc {

  NumberDesc _width;
  NumberDesc _hegith;

  double get defaultWidth => _width.defaultValue?.toDouble();
  double get defaultHeight => _hegith.defaultValue?.toDouble();

  SizeDesc(dynamic w, dynamic h, [double defaultW, double defaultH]) {

    _width = NumberDesc(w, defaultW);

    _hegith = NumberDesc(h, defaultH);
  }

  SizeDesc.defaultValue(double defaultW, double defaultH) {

    _width = NumberDesc.defaultValue(defaultW);

    _hegith = NumberDesc.defaultValue(defaultH);
  }

//  bool get isEmpty {
//
//    return _width.isEmpty &&
//        _hegith.isEmpty;
//  }
//
//  bool get isNotEmpty {
//
//    return _width.isNotEmpty ||
//        _hegith.isNotEmpty;
//  }

//  Size get sizeValue {
//
//    return Size(double.tryParse(_width) ?? 0,
//        double.tryParse(_hegith) ?? 0);
//  }

  double get widthValue {

    return _width.doubleValue;
  }

  double get heightValue {

    return _hegith.doubleValue;
  }

//  double get heightValue {
//
//    return double.tryParse(_hegith) ?? double.infinity;
//  }
}

import 'package:flutter/cupertino.dart';
import 'package:xtion_engine_widget/number_desc.dart';

class EdgeInsetDesc {

  NumberDesc _descL;
  NumberDesc _descT;
  NumberDesc _descR;
  NumberDesc _descB;

  double get defaultLeft => _descL.defaultValue?.toDouble();
  double get defaultTop => _descT.defaultValue?.toDouble();
  double get defaultRight => _descR.defaultValue?.toDouble();
  double get defaultBottom => _descB.defaultValue?.toDouble();

  EdgeInsetDesc(dynamic l, dynamic t, dynamic r, dynamic b,
  [double defaultL, double defaultT, double defaultR, double defaultB]) {

    _descL = NumberDesc(l, defaultL);
    _descT = NumberDesc(t, defaultT);
    _descR = NumberDesc(r, defaultR);
    _descB = NumberDesc(b, defaultB);
  }

  EdgeInsetDesc.defaultValue(double defaultL, double defaultT, double defaultR, double defaultB) {

    _descL = NumberDesc.defaultValue(defaultL);
    _descT = NumberDesc.defaultValue(defaultT);
    _descR = NumberDesc.defaultValue(defaultR);
    _descB = NumberDesc.defaultValue(defaultB);
  }

  EdgeInsetDesc.empty();

//  bool get isEmpty {
//
//    return _descL.isEmpty &&
//        _descT.isEmpty &&
//        _descR.isEmpty &&
//        _descB.isEmpty;
//  }
//
//  bool get isNotEmpty {
//
//    return _descL.isNotEmpty ||
//        _descT.isNotEmpty ||
//        _descR.isNotEmpty ||
//        _descB.isNotEmpty;
//  }

  EdgeInsets get edgeInsetValue {

    var l = _descL.doubleValue;
    var t = _descT.doubleValue;
    var r = _descR.doubleValue;
    var b = _descB.doubleValue;

    if(l == null && t == null && r == null && b == null) {
      return null;
    }

    return EdgeInsets.fromLTRB(l ?? 0, t ?? 0, r ?? 0, b ?? 0);
  }
}
import 'package:flutter/foundation.dart';
import 'package:xtion_engine_widget/title_view_desc.dart';
import 'package:xtion_engine_widget/widget_bridge/widget_bridge.dart';

abstract class ValueBridge {

  dynamic _value;

  var _listeners = List<Function(dynamic value)>();

  void addValueListener(Function(dynamic value) listener) {
    _listeners.add(listener);
  }

  dynamic get value {
    if(_value == null) {
      return descValue;
    }
    return _value;
  }

  set value(dynamic value) {
    if(value == _value)
      return;
    _value = value;
    _listeners.forEach((f){
      f(value);
    });
  }

  dynamic get descValue;
}
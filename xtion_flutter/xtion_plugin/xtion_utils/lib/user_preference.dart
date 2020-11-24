
import 'dart:async';

import 'package:flutter/services.dart';

class UserPreference {

  static const _userPreferenceChannnel = const MethodChannel('user_preference');
  
  static Future<void> putString(String key, String value, {String name}) {
    
    return _userPreferenceChannnel.invokeMethod("putString", {"key": key, "value": value, "name": name});
  }

  static Future<String> getString(String key, {String defautlValue, String name}) {

    return _userPreferenceChannnel.invokeMethod("getString", {"key": key, "defautlValue": defautlValue, "name": name});
  }

  static Future<void> putMap(Map<String, dynamic> value, {String name}) {
    
    return _userPreferenceChannnel.invokeMethod("putMap", {"value": value, "name": name});
  }

  static Future<Map<String, dynamic>> getMap({String name}) async {

    var tmp = Map<String, dynamic>();
    var r = await _userPreferenceChannnel.invokeMethod("getMap", {"name": name});
    (r as Map).forEach((key, value) {
      if(key is String) {
        tmp[key] = value;
      }
    });
    return tmp;
  }
  
}

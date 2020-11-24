
import 'dart:async';

import 'package:flutter/services.dart';

class XtionUtils {
  static const MethodChannel _channel =
      const MethodChannel('xtion_utils');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
  
  
}

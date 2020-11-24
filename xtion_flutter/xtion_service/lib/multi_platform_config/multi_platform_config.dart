
import 'dart:async';
import 'package:xtion_service/biz_http_request.dart';
import 'package:xtion_utils/user_preference.dart';
import 'package:synchronized/synchronized.dart';

class MultiPlatformConfig {

  static MultiPlatformConfig _instance = MultiPlatformConfig();

  static Map<String, dynamic> get config {
    return _instance._config;
  }

  String _configIP = "";
  String _configPort = "";

  Map<String, dynamic> _config = null;

  static setIPPort(String ip, String port) => _instance._setIPPort(ip, port);
  void _setIPPort(String ip, String port) {
    _configIP = ip;
    _configPort = port;
  }

  static Future<List> refreshMultiPlatConfigRequest(String entName) =>_instance._refreshMultiPlatConfigRequest(entName);
  Future<List> _refreshMultiPlatConfigRequest(String entName) async {

    var url = "$_configIP:$_configPort/multiplatconfig/env/$entName";
    var result = await BizHttpRequest.getURLRequest(url);

    var first = result.dataToList().first as Map<String, dynamic>;

    _saveMultiPlatConfig(first);

    return result.dataToList();
  }

  void _saveMultiPlatConfig(Map<String, dynamic> config) async {

    _config = config;

    await UserPreference.putMap(config, name: "multiplatConfig");
  }

  static Future<Map<String, dynamic>> loadMultiplatConfig() => _instance._loadMultiplatConfig();
  Future<Map<String, dynamic>> _loadMultiplatConfig() async {

    if(_config != null)
      return _config;

    var r = await UserPreference.getMap(name: "multiplatConfig");

    _config = r;
    return _config;
  }
}
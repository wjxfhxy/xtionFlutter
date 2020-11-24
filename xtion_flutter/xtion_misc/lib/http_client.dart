
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

enum RequestMethod {

  post,
  get
}

class HttpClient {

  static final _client = Dio();

  static Future<Response> request({@required String url, Map<String, dynamic> header, @required RequestMethod method, dynamic body, CancelToken cancelToken}) async {

    var methodS = "POST";
    if(method == RequestMethod.get)
      methodS = "GET";

    final options = Options(method: methodS, headers: header);

    try {

      Response resp = await _client.request(url, data: body, options: options, cancelToken: cancelToken);
      return resp;
    } on DioError catch(e) {
      return Future.error(e);
    }
  }
}
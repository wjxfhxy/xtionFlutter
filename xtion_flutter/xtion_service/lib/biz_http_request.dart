
import 'dart:async';
import 'package:xtion_misc/http_client.dart';
import 'package:xtion_service/biz_http_address.dart';
import 'package:xtion_service/biz_http_header.dart';
import 'package:xtion_service/biz_no_err_result.dart';

class BizHttpRequest {

  static Future<dynamic> postURIRequest(String uri, dynamic body) {

    var url = "${BizHttpAddress.address}/$uri";
    var header = BizHttpHeader.makeHeader();

    return HttpClient.request(url: url, method: RequestMethod.post, header:header, body: body);
  }

  static Future<dynamic> getURIRequest(String uri, dynamic body) {

    var url = "${BizHttpAddress.address}/$uri";

    return HttpClient.request(url: url, method: RequestMethod.get, body: body);
  }

  static Future<BizNoErrResult> getURLRequest(String url) async {

    try {
      var result = await HttpClient.request(url: url, method: RequestMethod.get, body: null);
      return BizNoErrResult(result.data);
    }
    catch (e, s) {
      print(s);

      rethrow;
    }
  }
}
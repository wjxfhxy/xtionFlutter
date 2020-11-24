
class BizNoErrResult {

  dynamic _data;

  BizNoErrResult(this._data);

  dynamic _respData() {

    if(_data is Map) {
      return _data["resp_data"];
    }
    return null;
  }

  Map<String, dynamic> dataToMap() {

    dynamic map = _respData();
    if(map == null || !(map is Map))
      return null;
    return map;
  }

  List<dynamic> dataToList() {

    dynamic list = _respData();
    if(list == null || !(list is List))
      return null;
    return list;
  }
}
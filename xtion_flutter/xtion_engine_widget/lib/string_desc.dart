
class StringDesc {

  String _rawValue;
  String _defaultValue;
  String _calculateResultValue;
  set calculateResultValue(String value) => _calculateResultValue = value;
  String get defaultValue => _defaultValue;

  StringDesc(dynamic desc, [this._defaultValue]) {

    _rawValue = desc as String ?? null;
  }

  StringDesc.defaultValue(this._defaultValue);

  bool get isCalculateValue {
    if(_rawValue != null) {
      if(_rawValue.matchAsPrefix("fly:") != null || _rawValue.matchAsPrefix("le:") != null) {
        return true;
      }
    }
    return false;
  }

  String get calculateValue => _rawValue;

  bool get boolValue {

    String tmp;
    if(_calculateResultValue != null)
      tmp = _calculateResultValue;
    else if(_rawValue != null)
      tmp = _rawValue;
    else
      tmp = _defaultValue;

    if(tmp != "1") {

      return false;
    }

    return true;
  }

}
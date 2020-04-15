
class NumberDesc {

  var _rawValue;
  num _defaultValue;
  num get defaultValue => _defaultValue;

  NumberDesc(dynamic desc, [this._defaultValue]) {

    _rawValue = desc as String ?? null;
  }

  NumberDesc.defaultValue(this._defaultValue);

  bool get isEmpty {

    if(_rawValue == null) return true;
    return _rawValue.isEmpty;
  }

  bool get isNotEmpty {

    if(_rawValue == null) return false;
    return _rawValue.isNotEmpty;
  }

  int get intValue {

    if(_rawValue != null) {
      var tmp = int.tryParse(_rawValue);
      if(tmp != null)
        return tmp;
    }

    if(_defaultValue == null)
      return null;
    return _defaultValue.toInt();
  }

  double get doubleValue {

    if(_rawValue != null) {
      var tmp = double.tryParse(_rawValue);
      if(tmp != null)
        return tmp;
    }

    if(_defaultValue == null)
      return null;
    return _defaultValue.toDouble();
  }

  bool get boolValue {

    if(_rawValue == null) {
      if(_defaultValue != null) {
        switch(_defaultValue as int) {
          case 1: return true;
          default:
            return false;
        }
      }
      else {
        return false;
      }
    }

    switch(_rawValue) {
      case "1": return true;
      default:
        return false;
    }
  }
}
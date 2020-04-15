
enum FlexDirection {
  horizontal,
  vertical
}

class FlexDirectionDesc {

  var _rawValue;

  FlexDirectionDesc(dynamic desc) {

    _rawValue = desc as String ?? null;
  }

  FlexDirection directionValue() {

    if(_rawValue == null || _rawValue == "")
      return FlexDirection.vertical;

    if(_rawValue == "horizontal")
      return FlexDirection.horizontal;

    return FlexDirection.vertical;
  }
}
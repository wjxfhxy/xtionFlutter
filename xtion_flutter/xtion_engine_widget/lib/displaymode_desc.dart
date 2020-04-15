
enum DisplayMode {

  free,   // 没有被panel包裹，或者被free模式的panel包裹时，控件的显示模式
  plain, // 被plain模式的panel包裹时的显示模式
  card,   // 被card模式的panel包裹的显示模式
  basic,          // 极简模式显示，通常用在table 或者 filter中
  compact    // 紧凑模式，用于显示只读的信息，可以最大限度的利用空间显示信息
}

class DisplayModeDesc {

  String _rawValue;
  DisplayMode _defaultValue;
  DisplayMode get defalutValue => _defaultValue;

  DisplayModeDesc(dynamic desc, [this._defaultValue]) {

    _rawValue = desc as String ?? null;
  }

  DisplayModeDesc.defaultValue(this._defaultValue);


  DisplayMode get displayModeValue {

    if(_rawValue == null && _defaultValue != null)
      return _defaultValue;

    if(_rawValue == "plain")
      return DisplayMode.plain;
    if(_rawValue == "free")
      return DisplayMode.free;
    if(_rawValue == "card")
      return DisplayMode.card;
    if(_rawValue == "basic")
      return DisplayMode.basic;
    if(_rawValue == "compact")
      return DisplayMode.compact;

    return DisplayMode.plain;
  }
}
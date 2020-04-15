
import 'list_map_desc.dart';

class OptionDesc extends ListMapDesc {

  static var KEY = "key";
  static var TEXT = "text";

  OptionDesc.defaultValue();

  OptionDesc(dynamic desc) {

    var options = desc as List ?? List();
    List<Map<String, String>> tmp = List();
    options.forEach((f) {
      var map = {"text": f["text"] as String ?? "", "key": f["key"] as String ?? ""};
      tmp.add(map);
    });
    list.addAll(tmp);
  }

  List<Map<String, String>> optionValue() => list;
}
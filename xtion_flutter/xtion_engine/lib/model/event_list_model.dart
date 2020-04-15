
import 'base_model.dart';

class EventListModel extends BaseModel {

  var trigger = "";
  var handler = "";

  EventListModel.fromJson(Map<String, dynamic> content): super.fromJson(content) {

    trigger = content["trigger"] as String ?? "";
    handler = content["handler"] as String ?? "";
  }

  static List<EventListModel> arrayFromJson(List content)  {

    var r = content.map((c) => EventListModel.fromJson(c));
    return r.toList();
  }


}
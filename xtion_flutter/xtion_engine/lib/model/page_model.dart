
import 'base_model.dart';
import 'event_list_model.dart';

import 'uimodel/view_model.dart';

class PageModel extends BaseModel {

  String title = "";
  String type = "";
  String pageDescr = "";
  List<EventListModel> eventList = new List();

  ViewModel rootViewModel;

  PageModel.fromJson(Map<String, dynamic> content): super.fromJson(content) {

    code = content["pageinfo"]["code"] as String ?? "";

    title = content["pageinfo"]["title"] as String ?? "";

    type = content["pageinfo"]["type"] as String ?? "";

    pageDescr = content["pageinfo"]["pagedescr"] as String ?? "";

    eventList = EventListModel.arrayFromJson(content["pageinfo"]["eventlist"]);

    rootViewModel = ViewModel.viewModelFactory(content["view"]["body"]);

    int a = 0;
  }

}

import '../base_model.dart';
import '../event_list_model.dart';
import '../../vm/view_vm.dart';
import '../../vm/vm_creator_mixin.dart';

import 'package:xtion_engine_widget/view_desc.dart';
import 'package:xtion_engine_widget/size_desc.dart';
import 'package:xtion_engine_widget/number_desc.dart';
import 'package:xtion_engine_widget/color_desc.dart';
import 'package:xtion_engine_widget/edge_inset_desc.dart';
import 'package:xtion_engine_widget/string_desc.dart';
import 'package:xtion_engine_widget/displaymode_desc.dart';


class ViewModel extends BaseModel with VMCreatorMixin {

  var type = "";
//  var flex = "0";
//  var hidden = "0";
  var name = "";

  List<EventListModel> eventList;

  List<ViewModel> subViewModelTree;

  ViewDesc viewDescription;

  static var _registerFactory;

  ViewModel.fromJSON(Map<String, dynamic> content): super.fromJson(content) {

    type = content["type"] as String ?? "";

    name = content["name"] as String ?? "";

    var eventList = content["eventlist"] as List ?? null;
    if(eventList != null)
      this.eventList = EventListModel.arrayFromJson(eventList);

    viewDescription = allocViewDescription();

    viewDescription.flex = NumberDesc(content["flex"], viewDescription.flex.defaultValue);

    viewDescription.flexGrow = NumberDesc(content["flexgrow"], viewDescription.flexGrow.defaultValue);

    viewDescription.hidden = StringDesc(content["hidden"], viewDescription.hidden.defaultValue);

    viewDescription.displayMode = DisplayModeDesc(content["mode"], viewDescription.displayMode.defalutValue);

    var bgcolor = content["bgcolor"] ?? null;
    if(bgcolor != null && ((bgcolor as String) ?? "") != "") {
      viewDescription.backgroundColor = ColorDesc(bgcolor, viewDescription.backgroundColor.defalutValue);
    }
    else {
      viewDescription.backgroundColor = ColorDesc(content["backgroundcolor"], viewDescription.backgroundColor.defalutValue);
    }

    var textcolor = content["color"] ?? null;
    if(textcolor != null && ((textcolor as String) ?? "") != "") {
      viewDescription.textColor = ColorDesc(textcolor, viewDescription.textColor.defalutValue);
    }
    else {
      viewDescription.textColor = ColorDesc(content["textcolor"], viewDescription.textColor.defalutValue);
    }

    viewDescription.size = SizeDesc(
        content["width"], content["height"],
        viewDescription.size.defaultWidth, viewDescription.size.defaultHeight
    );

    viewDescription.maxSize = SizeDesc(
        content["maxwidth"], content["maxheight"],
        viewDescription.maxSize.defaultWidth, viewDescription.maxSize.defaultHeight
    );

    var marginleft = content["marginleft"] ?? null;
    var margintop = content["margintop"] ?? null;
    var marginright = content["marginright"] ?? null;
    var marginbottom = content["marginbottom"] ?? null;
    if((marginleft == null || marginleft == "") && (marginright == null || marginright == "")) {
      marginleft = content["marginhorizontal"] ?? null;
      marginright = marginleft;
    }
    if((margintop == null || margintop == "") && (marginbottom == null || marginbottom == "")) {
      margintop = content["marginvertical"] ?? null;
      marginbottom = margintop;
    }

    viewDescription.margin = EdgeInsetDesc(
        marginleft, margintop, marginright, marginbottom,
        viewDescription.margin.defaultLeft, viewDescription.margin.defaultTop,
        viewDescription.margin.defaultRight, viewDescription.margin.defaultBottom
    );

    viewDescription.padding = EdgeInsetDesc(
        content["paddinghorizontal"], content["paddingvertical"], content["paddinghorizontal"], content["paddingvertical"],
        viewDescription.padding.defaultLeft, viewDescription.padding.defaultTop,
        viewDescription.padding.defaultRight, viewDescription.padding.defaultBottom
    );

    var tmp = content["content"] as List ?? null;
    if(tmp != null)
      subViewModelTree = tmp.map( (c) => viewModelFactory(c) ).toList();
  }

  List<ViewModel> _subViewModelList;
  List<ViewModel> get subViewModelList {

    if(_subViewModelList == null) {
      _subViewModelList = new List<ViewModel>();

      subViewModelTree?.forEach((c) {
        _subViewModelList.add(c);
        _subViewModelList.addAll(c.subViewModelList);
      });
    }
    return _subViewModelList;
  }

  allocViewDescription() => ViewDesc();

//  parseJSON(Map<String, dynamic> content) {
//
//    if(viewDescription == null) {
//      viewDescription = ViewDescription
//    }
//
//  }

  @override
  ViewVM createVM() {

    return ViewVM.fromViewModel(this);
  }

  @override
  ViewVM createVMTree() {

    var viewVM = createVM();
    subViewModelTree?.forEach( (c) =>  viewVM.addSubViewVM(c.createVMTree()) );
    return viewVM;
  }

  static ViewModel viewModelFactory(Map<String, dynamic> content) {

    return _registerFactory(content);
  }

  static registerModelFactory(ViewModel closure(Map<String, dynamic> content)) {

    _registerFactory = closure;
  }
}

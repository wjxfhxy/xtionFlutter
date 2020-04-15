
import 'package:xtion_engine/model/uimodel/view_model.dart';
import 'package:xtion_engine/vm/view_vm.dart';
import 'package:xtion_widget/viewdesc/layout_desc.dart';
import 'package:xtion_engine_widget/flex_direction_desc.dart';
import '../vm/layout_vm.dart';


class LayoutModel extends ViewModel {

  var overflow = "";

  LayoutModel.fromJSON(Map<String, dynamic> content): super.fromJSON(content) {
    overflow = content["overflow"] as String ?? "";
    if (overflow == "0" || overflow == "hidden")
      overflow = "0";

    var desc = viewDescription as LayoutDesc;

    desc.flexDirection = FlexDirectionDesc(content["flexdirection"]);

    subViewModelTree?.forEach((f) => f.viewDescription.parantFlexDirection = desc.flexDirection);
  }

  @override
  allocViewDescription() => LayoutDesc();

  @override
  ViewVM createVM() {

    return LayoutVM.fromViewModel(this);
  }
}
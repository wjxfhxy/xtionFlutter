
import 'package:xtion_engine/model/uimodel/view_model.dart';
import 'package:xtion_engine/vm/view_vm.dart';
import 'package:xtion_engine_widget/flex_direction_desc.dart';
import 'package:xtion_vm/vm/panel_vm.dart';
import 'package:xtion_widget/viewdesc/panel_desc.dart';

class PanelModel extends ViewModel {

  PanelModel.fromJSON(Map<String, dynamic> content): super.fromJSON(content) {

    var desc = viewDescription as PanelDesc;

    desc.flexDirection = FlexDirectionDesc(content["flexdirection"]);
  }

  @override
  allocViewDescription() => PanelDesc();

  @override
  ViewVM createVM() {

    return PanelVM.fromViewModel(this);
  }
}
import 'package:xtion_engine/model/uimodel/view_model.dart';
import 'package:xtion_engine/vm/view_vm.dart';
import 'package:xtion_engine_widget/option_desc.dart';
import 'package:xtion_widget/viewdesc/selectbox_desc.dart';
import '../vm/selectbox_vm.dart';
import 'InputViewAbilityMixin.dart';

class SelectBoxModel extends ViewModel with InputViewAbilityMixin {

  SelectBoxModel.fromJSON(Map<String, dynamic> content): super.fromJSON(content) {

    var desc = viewDescription as SelectBoxDesc;

    inputViewAbilityFromJSON(content, desc);

    desc.options = OptionDesc(content["options"]);
  }

  @override
  allocViewDescription() => SelectBoxDesc();

  @override
  ViewVM createVM() {

    return SelectBoxVM.fromViewModel(this);
  }
}
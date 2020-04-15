import 'package:xtion_engine/model/uimodel/view_model.dart';
import 'package:xtion_engine/vm/view_vm.dart';
import 'package:xtion_widget/viewdesc/dropdownbox_desc.dart';
import '../vm/dropdownbox_vm.dart';
import 'InputViewAbilityMixin.dart';

class DropdownBoxModel extends ViewModel with InputViewAbilityMixin {

  DropdownBoxModel.fromJSON(Map<String, dynamic> content): super.fromJSON(content) {

    var desc = viewDescription as DropdownBoxDesc;

    inputViewAbilityFromJSON(content, desc);

    var options = content["options"] as List ?? List();
    List<Map<String, String>> tmp = List();
    options.forEach((f) {
      var map = {"text": f["text"] as String ?? "", "key": f["key"] as String ?? ""};
      tmp.add(map);
    });
    desc.options = tmp;
  }

  @override
  allocViewDescription() => DropdownBoxDesc();

  @override
  ViewVM createVM() {

    return DropdownBoxVM.fromViewModel(this);
  }
}
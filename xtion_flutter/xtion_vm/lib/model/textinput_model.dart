import 'package:xtion_engine/model/uimodel/view_model.dart';
import 'package:xtion_engine/vm/view_vm.dart';
import 'package:xtion_widget/viewdesc/textinput_desc.dart';
import '../vm/textinput_vm.dart';
import 'InputViewAbilityMixin.dart';

class TextInputModel extends ViewModel with InputViewAbilityMixin {

  TextInputModel.fromJSON(Map<String, dynamic> content): super.fromJSON(content) {

    var desc = viewDescription as TextInputDesc;

    inputViewAbilityFromJSON(content, desc);

    desc.maxLength = content["maxlength"] as String ?? "";
  }

  @override
  allocViewDescription() => TextInputDesc();

  @override
  ViewVM createVM() {

    return TextInputVM.fromViewModel(this);
  }
}
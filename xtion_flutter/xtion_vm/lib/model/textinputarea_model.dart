import 'package:xtion_engine/model/uimodel/view_model.dart';
import 'package:xtion_engine/vm/view_vm.dart';
import 'package:xtion_engine_widget/number_desc.dart';
import 'package:xtion_widget/viewdesc/textinputarea_desc.dart';
import '../vm/textinputarea_vm.dart';
import 'InputViewAbilityMixin.dart';

class TextInputAreaModel extends ViewModel with InputViewAbilityMixin {

  TextInputAreaModel.fromJSON(Map<String, dynamic> content): super.fromJSON(content) {

    var desc = viewDescription as TextInputAreaDesc;

    inputViewAbilityFromJSON(content, desc);

    desc.maxLength = NumberDesc(content["maxlength"], desc.maxLength.defaultValue);
  }

  @override
  allocViewDescription() => TextInputAreaDesc();

  @override
  ViewVM createVM() {

    return TextInputAreaVM.fromViewModel(this);
  }
}
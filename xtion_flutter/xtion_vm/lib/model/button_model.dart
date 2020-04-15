import 'package:xtion_engine/model/uimodel/view_model.dart';
import 'package:xtion_engine/vm/view_vm.dart';
import 'package:xtion_widget/viewdesc/button_desc.dart';
import '../vm/button_vm.dart';

class ButtonModel extends ViewModel {

  ButtonModel.fromJSON(Map<String, dynamic> content): super.fromJSON(content) {

    var desc = viewDescription as ButtonDesc;

    desc.title = content["title"] as String ?? "";
  }

  @override
  allocViewDescription() => ButtonDesc();

  @override
  ViewVM createVM() {

    return ButtonVM.fromViewModel(this);
  }
}
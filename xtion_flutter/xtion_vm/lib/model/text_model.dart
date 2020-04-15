import 'package:flutter/cupertino.dart';
import 'package:xtion_engine/model/uimodel/view_model.dart';
import 'package:xtion_engine/vm/view_vm.dart';
import 'package:xtion_widget/viewdesc/text_desc.dart';
import 'package:xtion_engine_widget/text_align_desc.dart';
import 'package:xtion_engine_widget/number_desc.dart';
import 'package:xtion_engine_widget/color_desc.dart';
import '../vm/text_vm.dart';

class TextModel extends ViewModel {

  TextModel.fromJSON(Map<String, dynamic> content): super.fromJSON(content) {

    var desc = viewDescription as TextDesc;

    desc.lineNumber = NumberDesc(content["linenumber"], desc.lineNumber.defaultValue);

    desc.value = content["value"] as String ?? "";

    if(content.containsKey("color")) {
      desc.textColor = ColorDesc(content["color"], desc.textColor.defalutValue);
    }
    else {
      desc.textColor = ColorDesc(content["textcolor"], desc.textColor.defalutValue);
    }

    desc.fontSize = NumberDesc(content["fontsize"], desc.fontSize.defaultValue);

    desc.borderVisible = NumberDesc(content["bordervisible"], desc.borderVisible.defaultValue);

    desc.textAlign = TextAlignDesc(content["textalign"], desc.textAlign.defaultValue);
  }

  @override
  allocViewDescription() => TextDesc();

  @override
  ViewVM createVM() {

    return TextVM.fromViewModel(this);
  }
}
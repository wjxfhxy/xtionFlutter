
import 'package:flutter/material.dart';
import 'package:xtion_engine/vm/view_vm.dart';
import 'package:xtion_widget/textinput_widget.dart';
import 'package:xtion_engine_widget/widget_bridge/title_widget_bridge.dart';
import 'package:xtion_widget/viewdesc/textinput_desc.dart';
import '../model/textinput_model.dart';

class TextInputVM<T extends TextInputDesc> extends ViewVM {

  TitleWidgetBridge<T> bridge;

  TextInputVM.fromViewModel(TextInputModel viewModel): super.fromViewModel(viewModel) {

    var desc = (viewModel.viewDescription as TextInputDesc);

    bridge = TitleWidgetBridge(desc);
    bridge.addValueListener(listenValueChanged);

    if(desc.title.contains("1") ) {

      Future.delayed(Duration(seconds: 3), (){

        updateData("9999999988800000000");
      });
    }
  }

  @override
  Widget createViewWidget() {

    return TextInputWidget(bridge);
  }

  void listenValueChanged(dynamic value) {

    print(value);
  }

  @override
  void updateData(dynamic data) {

    var tmp = data as String;

    bridge.value = tmp;
  }
}
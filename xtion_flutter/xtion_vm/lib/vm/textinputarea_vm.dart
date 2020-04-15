
import 'package:flutter/material.dart';
import 'package:xtion_engine/vm/view_vm.dart';
import 'package:xtion_widget/textinputarea_widget.dart';
import 'package:xtion_widget/viewdesc/textinputarea_desc.dart';
import 'package:xtion_engine_widget/widget_bridge/title_widget_bridge.dart';
import '../model/textinputarea_model.dart';

class TextInputAreaVM<T extends TextInputAreaDesc> extends ViewVM {

  TitleWidgetBridge<T> bridge;

  TextInputAreaVM.fromViewModel(TextInputAreaModel viewModel): super.fromViewModel(viewModel) {

    var desc = (viewModel.viewDescription as TextInputAreaDesc);

    bridge = TitleWidgetBridge(desc);
    bridge.addValueListener(listenValueChanged);
  }

  @override
  Widget createViewWidget() {

    return TextInputAreaWidget(bridge);
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

import 'package:flutter/material.dart';
import 'package:xtion_engine/vm/view_vm.dart';
import 'package:xtion_engine/model/uimodel/view_model.dart';
import 'package:xtion_engine_widget/widget_bridge/title_widget_bridge.dart';
import 'package:xtion_widget/text_widget.dart';
import 'package:xtion_widget/widget_bridge/text_bridge.dart';
import 'package:xtion_widget/viewdesc/text_desc.dart';
import '../model/text_model.dart';

class TextVM<T extends TextDesc> extends ViewVM {

  TextBridge<T> bridge;

  TextVM.fromViewModel(ViewModel viewModel): super.fromViewModel(viewModel) {

    var desc = (viewModel.viewDescription as TextDesc);

    bridge = TextBridge(desc);
  }

  @override
  Widget createViewWidget() {

    return TextWidget(bridge);
  }

  @override
  void updateData(dynamic data) {

    var tmp = data as String;

    bridge.value = tmp;
  }
}
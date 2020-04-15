
import 'package:flutter/material.dart';
import 'package:xtion_engine/vm/view_vm.dart';
import 'package:xtion_vm/model/dropdownbox_model.dart';
import 'package:xtion_widget/dropdownbox_widget.dart';
import 'package:xtion_widget/viewdesc/dropdownbox_desc.dart';
import 'package:xtion_engine_widget/widget_bridge/title_widget_bridge.dart';
import '../model/dropdownbox_model.dart';

class DropdownBoxVM<T extends DropdownBoxDesc> extends ViewVM {

  TitleWidgetBridge<T> bridge;

  DropdownBoxVM.fromViewModel(DropdownBoxModel viewModel): super.fromViewModel(viewModel) {

    var desc = (viewModel.viewDescription as DropdownBoxDesc);

    bridge = TitleWidgetBridge(desc);
    bridge.addValueListener(listenValueChanged);
  }

  @override
  Widget createViewWidget() {

    return DropdownBoxWidget(bridge);
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
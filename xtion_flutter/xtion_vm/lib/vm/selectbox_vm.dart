
import 'package:flutter/material.dart';
import 'package:xtion_engine/vm/view_vm.dart';
import 'package:xtion_engine_widget/widget_bridge/title_widget_bridge.dart';
import 'package:xtion_widget/selectbox_widget.dart';
import 'package:xtion_widget/viewdesc/selectbox_desc.dart';
import '../model/selectbox_model.dart';

class SelectBoxVM<T extends SelectBoxDesc> extends ViewVM {

  TitleWidgetBridge<T> bridge;

  SelectBoxVM.fromViewModel(SelectBoxModel viewModel): super.fromViewModel(viewModel) {

    var desc = (viewModel.viewDescription as SelectBoxDesc);

    bridge = TitleWidgetBridge(desc);
    bridge.addValueListener(listenValueChanged);
  }

  @override
  Widget createViewWidget() {

    return SelectBoxWidget(bridge);
  }

  @override
  void changeProperty(String property, String value) {

    bridge.changeDescriptionValue(property, value);
  }

//  void changeDescription(WidgetProperty propertyValue) {
//
//    _controller.changeDescription(propertyValue);
//  }

  void listenValueChanged(dynamic value) {

    print(value);
//    this.value = value;
//
//    //todo 测试
//    callback.exceEvent(null, value == "1" ? "lllll": "aaaaa");
  }

  @override
  void updateData(dynamic data) {

    var tmp = data as String;
  }
}
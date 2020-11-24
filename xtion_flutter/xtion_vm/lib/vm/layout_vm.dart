
import 'package:flutter/material.dart';
import 'package:xtion_engine_widget/widget_bridge/widget_bridge.dart';
import 'package:xtion_engine/vm/view_vm.dart';
import 'package:xtion_engine/model/uimodel/view_model.dart';
import 'package:xtion_vm/model/layout_model.dart';
import 'package:xtion_widget/layout_widget.dart';
import 'package:xtion_widget/staticlayout_widget.dart';
import 'package:xtion_widget/viewdesc/layout_desc.dart';

class LayoutVM<T extends LayoutDesc> extends ViewVM {

  WidgetBridge<T> _bridge;

  LayoutVM.fromViewModel(ViewModel viewModel): super.fromViewModel(viewModel) {

    var desc = viewModel.viewDescription as LayoutDesc;

    _bridge = WidgetBridge(desc);
  }

  @override
  Widget createViewWidget() {

    var model = viewModel as LayoutModel;

    if(_bridge.desc.overflow == "0")
      return StaticLayoutWidget(model.viewDescription);

    return LayoutWidget(_bridge);
  }
}
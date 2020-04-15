import 'package:flutter/material.dart';
import 'package:xtion_engine/vm/view_vm.dart';
import 'package:xtion_engine/model/uimodel/view_model.dart';
import 'package:xtion_widget/button_widget.dart';
import 'package:xtion_widget/viewdesc/button_desc.dart';
import 'package:xtion_engine_widget/widget_bridge/widget_bridge.dart';
import '../model/button_model.dart';

class ButtonVM<T extends ButtonDesc> extends ViewVM {

  WidgetBridge<T> bridge;

  ButtonVM.fromViewModel(ViewModel viewModel): super.fromViewModel(viewModel) {

    var desc = (viewModel.viewDescription as ButtonDesc);

    bridge = WidgetBridge(desc);
  }

  @override
  Widget createViewWidget() {

    var model = viewModel as ButtonModel;

    return ButtonWidget(bridge, (buildContext) {

      var event = model.eventList?.firstWhere((f) => f.trigger == "onclicked", orElse:() => null);
      if(event != null)
        callback.exceEvent(buildContext, event.handler);
    });
  }
}
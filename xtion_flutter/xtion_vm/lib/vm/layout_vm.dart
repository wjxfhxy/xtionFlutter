
import 'package:flutter/material.dart';
import 'package:xtion_engine/vm/view_vm.dart';
import 'package:xtion_engine/model/uimodel/view_model.dart';
import 'package:xtion_vm/model/layout_model.dart';
import 'package:xtion_widget/layout_widget.dart';
import 'package:xtion_widget/staticlayout_widget.dart';

class LayoutVM extends ViewVM {

  LayoutVM.fromViewModel(ViewModel viewModel): super.fromViewModel(viewModel) {

  }

  @override
  Widget createViewWidget() {

    var model = viewModel as LayoutModel;

    if(model.overflow == "0")
      return StaticLayoutWidget(model.viewDescription);

    return LayoutWidget();
  }
}
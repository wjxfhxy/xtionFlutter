
import 'package:flutter/material.dart';
import 'package:xtion_engine/model/uimodel/view_model.dart';
import 'package:xtion_engine/vm/view_vm.dart';
import 'package:xtion_vm/model/panel_model.dart';
import 'package:xtion_widget/panel_widget.dart';

class PanelVM extends ViewVM {

  PanelVM.fromViewModel(ViewModel viewModel): super.fromViewModel(viewModel) {

  }

  @override
  Widget createViewWidget() {

    var model = viewModel as PanelModel;

    return PanelWidget(model.viewDescription);
  }
}
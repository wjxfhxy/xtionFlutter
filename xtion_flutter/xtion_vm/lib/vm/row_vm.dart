import 'package:flutter/material.dart';
import 'package:xtion_engine/vm/view_vm.dart';
import 'package:xtion_engine/model/uimodel/view_model.dart';
import 'package:xtion_widget/row_widget.dart';
import '../model/row_model.dart';

class RowVM extends ViewVM {

  RowVM.fromViewModel(ViewModel viewModel): super.fromViewModel(viewModel);

  @override
  Widget createViewWidget() {

    var model = viewModel as RowModel;

    return RowWidget();
  }

  @override
  void updateData(dynamic data) {

    var tmp = data as Map<String, String>;

    for (var subVM in subVMList) {

      if(tmp.containsKey(subVM.code)) {

        var value = tmp[subVM.code];
        subVM.updateData(value);
      }
    }
  }
}
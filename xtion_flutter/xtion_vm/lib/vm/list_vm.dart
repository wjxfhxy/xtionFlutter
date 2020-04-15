
import 'package:flutter/material.dart';
import 'package:xtion_engine/model/uimodel/view_model.dart';
import 'package:xtion_engine/vm/view_vm.dart';
import 'package:xtion_vm/vm/row_vm.dart';
import 'package:xtion_widget/list_widget.dart';
import 'package:xtion_widget/widget_bridge/list_bridge.dart';
import 'package:xtion_widget/viewdesc/list_desc.dart';
import 'package:xtion_widget/row_widget.dart';
import '../model/list_model.dart';

class ListVM<T extends ListDesc> extends ViewVM {

  ListBridge<T> bridge;

  ListVM.fromViewModel(ListModel viewModel): super.fromViewModel(viewModel) {

    var desc = viewModel.viewDescription as ListDesc;
    bridge = ListBridge(desc, itemCount, itemBuilder);
  }

  List<Map<String, String>> data;


  @override
  Widget createViewWidget() {

    Future.delayed(Duration(seconds: 2), (){

      updateData(null);
      bridge.reloadData();
    });

    updateData(null);

    return ListWidget(bridge);
  }

  Widget itemBuilder(int index)  {

    var model = viewModel as ListModel;

    RowVM rowVM = model.rowModel.createVMTree();
    Widget widget = rowVM.createWidgetTree();

    rowVM.updateData(data[index]);

    return widget;
  }

  int itemCount() {

//    if(data != null)
//      return data.length;
//
//    return 0;

  return 1;
  }

  void updateData(dynamic data) {
    
    List l = List<Map<String, String>>();
    for(int i = 0; i< 5000;i++) {
      l.add({
        "a": "this is a",
        "b": "this is b",
        "c": "this is c"
      });
    }

    this.data = l;
  }
}
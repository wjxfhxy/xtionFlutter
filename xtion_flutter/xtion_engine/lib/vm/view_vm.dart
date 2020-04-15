
import 'package:flutter/material.dart';
import 'package:xtion_engine_widget/view_widget.dart';
import 'package:xtion_engine_widget/view_widget_creator_mixin.dart';
import 'package:xtion_engine_widget/view_widget_mixin.dart';
import '../model/uimodel/view_model.dart';
import 'view_vm_callback.dart';

class ViewVM with ViewWidgetCreatorMixin {

  ViewModel viewModel;

  ViewVMCallback callback;

  List<ViewVM> subVMTree = new List<ViewVM>();

  List<ViewVM> _subVMList;
  List<ViewVM> get subVMList {

    if(_subVMList == null) {
      _subVMList = new List<ViewVM>();

      subVMTree.forEach((c) {
        _subVMList.add(c);
        _subVMList.addAll(c.subVMList);
      });
    }
    return _subVMList;
  }

  String get code => viewModel.code;

  String get name => viewModel.name;

  ViewVM.fromViewModel(ViewModel viewModel) {

    this.viewModel = viewModel;
  }

  addSubViewVM(ViewVM vm) {

    subVMTree.add(vm);
  }

  @override
  Widget createViewWidget() {

    return ViewWidget();
  }

  @override
  Widget createWidgetTree() {

    var list = List<Widget>();

    subVMTree.forEach( (c) => list.add(c.createWidgetTree()) );

    var viewWidget = createViewWidget();
    (viewWidget as ViewWidgetMixin).addSubWidgets(list);

    return viewWidget;
  }

  void updateData(dynamic data) { }

  //todo test
  void changeProperty(String property, String value) {

  }
}
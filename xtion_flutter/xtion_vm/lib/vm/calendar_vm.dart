import 'package:flutter/material.dart';
import 'package:xtion_engine/vm/view_vm.dart';
import 'package:xtion_engine/model/uimodel/view_model.dart';
import 'package:xtion_vm/model/calendar_model.dart';
import 'package:xtion_widget/calendar_widget.dart';

class CalendarVM extends ViewVM {

  CalendarVM.fromViewModel(ViewModel viewModel): super.fromViewModel(viewModel);

  @override
  Widget createViewWidget() {

    var model = viewModel as CalendarModel;

    return CalendarWidget();
  }
}
//library xtion_engine;

import 'package:flutter/material.dart';
import 'package:xtion_engine/page_central_widget.dart';
import 'package:xtion_engine/page_index.dart';
import 'dart:io';
import 'page_parser.dart';
import 'model/page_model.dart';
import 'model/uimodel/view_model.dart';
import 'vm/view_vm.dart';
import 'vm/view_vm_callback.dart';

class PageCentralController with ViewVMCallback {

  PageModel pageModel;

  ViewVM rootVM;
  List<ViewVM> allViewVM = List<ViewVM>();

  Widget rootView;

  Widget titleView;

  PageIndex pageIndex;

  PageCentralController(this.pageIndex);

  loadPage(completionHandler(Widget rootView)) {

    pageModel = PageParser.parse(pageIndex);

    rootVM = pageModel.rootViewModel.createVMTree();
    allViewVM.addAll(recursionRooVM(rootVM));
    allViewVM.forEach((it)=>it.callback = this);

    rootView = rootVM.createWidgetTree();

    titleView = Text(pageModel.title);

    completionHandler(rootView);
  }

  createViewVMTree() {

    return pageModel.rootViewModel.createVMTree();
  }

  List<ViewVM> recursionRooVM(ViewVM viewVM) {

    List<ViewVM> allViewVM = List<ViewVM>();

    allViewVM.add(viewVM);

    viewVM.subVMTree.forEach( (ViewVM it) {

      allViewVM.addAll(recursionRooVM(it));
    });

    return allViewVM;
  }

  void exceEvent(BuildContext buildContext, String handler) {

    if(handler == "lllll") {

      allViewVM.forEach( (f){
        if(f.code == "selectbox2") {
          f.changeProperty("hidden", "1");
        }
        if(f.code == "selectbox3") {
          f.changeProperty("hidden", "2");
        }
      });

      return;
    }
    else if(handler == "aaaaa") {

      allViewVM.forEach( (f){
        if(f.code == "selectbox2") {
          f.changeProperty("hidden", "0");
        }
        if(f.code == "selectbox3") {
          f.changeProperty("hidden", "1");
        }
      });

      return;
    }


    Navigator.push(
      buildContext,
      new MaterialPageRoute(builder: (context) => PageCentralWidget(handler)),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:xtion_engine_widget/widget_bridge/widget_bridge.dart';
import 'package:xtion_widget/viewdesc/list_desc.dart';

class ListBridge<T extends ListDesc> extends WidgetBridge<T> {

  Widget Function(int index) _itemBuilder;
  Widget Function(int index) get itemBuilder => _itemBuilder;

  int Function() _itemCount;
  int Function() get itemCount => _itemCount;

  void Function() reloadDataListen;

  ListBridge(T desc, this._itemCount, this._itemBuilder): super(desc);

  reloadData() {

    if(reloadDataListen != null)
      reloadDataListen();
  }
}
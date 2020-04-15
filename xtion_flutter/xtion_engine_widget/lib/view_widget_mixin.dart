
import 'package:flutter/material.dart';

abstract class ViewWidgetMixin {

  List<Widget> subWidgets = List<Widget>();

  addSubWidgets(List<Widget> widgets) {

    subWidgets.addAll(widgets);
  }

  addSubWidget(Widget widget) {

    subWidgets.add(widget);
  }
}
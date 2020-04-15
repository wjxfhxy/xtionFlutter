
import 'package:flutter/material.dart';
import 'package:xtion_engine_widget/view_widget_mixin.dart';

abstract class ViewWidgetCreatorMixin {

  Widget createViewWidget();

  Widget createWidgetTree();
}
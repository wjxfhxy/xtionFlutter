
import 'package:flutter/material.dart';
import 'view_widget_mixin.dart';

class ViewWidget extends StatelessWidget with ViewWidgetMixin {

  @override
  Widget getWidget() {
    return this;
  }

  @override
  Widget build(BuildContext context) {

    return Container();
  }
}

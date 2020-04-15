
import 'package:flutter/material.dart';
import 'package:xtion_engine_widget/view_widget_mixin.dart';
import 'package:xtion_engine_widget/flex_direction_desc.dart';
import 'viewdesc/layout_desc.dart';
import 'SelfExpendable.dart';

class StaticLayoutWidget extends StatelessWidget with ViewWidgetMixin {

  final LayoutDesc _desc;

  StaticLayoutWidget(this._desc) : super();

  @override
  Widget build(BuildContext context) {


   if(_desc.flexDirection.directionValue() == FlexDirection.horizontal) {

     return Row(children: subWidgets,);
   }

   if(_desc.flex.intValue == 1) {

     return  Expanded(child: Column(children: subWidgets));
   }

   return Column(children: subWidgets);
  }
}

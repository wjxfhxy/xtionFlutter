
import 'package:flutter/material.dart';
import 'package:xtion_engine_widget/view_widget_mixin.dart';
import 'package:xtion_widget/staticlayout_widget.dart';

class RowWidget extends StatelessWidget with ViewWidgetMixin {

  @override
  Widget build(BuildContext context) {

    List<Widget> l = List<Widget>();//subWidgets.map((f) => Expanded(child: f,)).toList();

//    if(subWidgets.first is StaticLayoutWidget) {
//
//      l = (subWidgets.first as StaticLayoutWidget).subWidgets.map((f) =>  f).toList();
//    }
//
    subWidgets.forEach((c) =>

        (c as StaticLayoutWidget).subWidgets.map((f) =>  f).toList().forEach((f) => l.add(f))
    );

    return Column(children: subWidgets,);

  //  return Container(child: l[0], color: Colors.red,);

    //return Container(child: subWidgets[0], color: Colors.red,);
  }
}

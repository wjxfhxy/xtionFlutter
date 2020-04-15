import 'package:flutter/material.dart';
import 'package:xtion_engine_widget/displaymode_desc.dart';
import 'package:xtion_engine_widget/view_widget_mixin.dart';
import 'package:xtion_engine_widget/divider_container.dart';
import 'package:xtion_engine_widget/round_container.dart';
import 'package:xtion_engine_widget/flex_direction_desc.dart';
import 'package:xtion_engine_widget/widget_bridge/widget_bridge.dart';
import 'viewdesc/button_desc.dart';


class ButtonWidget<T extends ButtonDesc> extends StatelessWidget with ViewWidgetMixin {

  WidgetBridge<T> _bridge;

  void Function(BuildContext context) onPressed;

  ButtonWidget(this._bridge, this.onPressed): super();

  @override
  Widget build(BuildContext context) {

    var desc = _bridge.desc;

    Widget w = MaterialButton(
      color: desc.backgroundColor.colorValue,
      textColor: desc.textColor.colorValue,
      child: new Text(desc.title),
      height: double.infinity,
      minWidth: double.infinity,
      onPressed: () {

        onPressed(context);
      },);

    w = RoundContainer(w, desc.margin.edgeInsetValue, desc.size.heightValue);

    if(desc.displayMode.defalutValue == DisplayMode.plain)
      w = DividerContainer(w);

    if(desc.parantFlexDirection.directionValue() == FlexDirection.vertical) {
      w = Row(children: <Widget>[Expanded(child: w,)],);
    }
    else {
      w = Expanded(child: w,);
    }

    return w;
  }
}
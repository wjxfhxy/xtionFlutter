
import 'package:flutter/material.dart';
import 'package:xtion_engine_widget/displaymode_desc.dart';
import 'package:xtion_engine_widget/flex_direction_desc.dart';
import 'package:xtion_engine_widget/option_desc.dart';
import 'package:xtion_engine_widget/view_widget_mixin.dart';
import 'package:xtion_engine_widget/divider_container.dart';
import 'package:xtion_engine_widget/round_container.dart';
import 'package:xtion_engine_widget/title_input_container.dart';
import 'package:xtion_engine_widget/widget_bridge/title_widget_bridge.dart';
import 'package:xtion_widget/supplement/select_radio.dart';
import 'viewdesc/selectbox_desc.dart';

class SelectBoxWidget<T extends SelectBoxDesc> extends StatefulWidget with ViewWidgetMixin {

  TitleWidgetBridge<T> _bridge;

  SelectBoxWidget(this._bridge) : super();

  @override
  createState() => _SelectBoxWidgetState();
}

class _SelectBoxWidgetState extends State<SelectBoxWidget> {

  String groupValue = "unknow";

  @override
  void initState() {
    super.initState();

    widget._bridge.propertyValueChanged = () {
      setState(() {
      });
    };
  }

  @override
  Widget build(BuildContext context) {

    var desc = widget._bridge.desc;

    if(desc.hidden.boolValue) {
      return Offstage();
    }

    var rows = desc.options.optionValue().map((f) {

      return Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Radio(
        value: f[OptionDesc.KEY],
        activeColor: Colors.blue,
        groupValue: groupValue,
        onChanged: (value) {
          this.groupValue = value;
          widget._bridge.value = value;
          setState(() {
          });
        },
      ),
        Text(f[OptionDesc.TEXT]),]);
    });

    Widget w;

    w = Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: rows.toList(),
    );

    //   w = Align(child: w, alignment: Alignment.topLeft,);

    w = TitleInputContainer(desc.title, desc.required.boolValue, w, childDirection: Axis.vertical,);

    w = RoundContainer(w, desc.margin.edgeInsetValue, null);

    if(desc.displayMode.defalutValue == DisplayMode.plain)
      w = DividerContainer(w);

    if(desc.parantFlexDirection.directionValue() == FlexDirection.vertical) {
      w = Row(children: <Widget>[Expanded(child: w,)],);
    }

    return w;
  }
}

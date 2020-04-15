import 'package:flutter/material.dart';
import 'package:xtion_engine_widget/displaymode_desc.dart';
import 'package:xtion_engine_widget/flex_direction_desc.dart';
import 'package:xtion_engine_widget/view_widget_mixin.dart';
import 'package:xtion_engine_widget/divider_container.dart';
import 'package:xtion_engine_widget/round_container.dart';
import 'package:xtion_engine_widget/title_input_container.dart';
import 'package:xtion_engine_widget/widget_bridge/title_widget_bridge.dart';
import 'viewdesc/textinputarea_desc.dart';

class TextInputAreaWidget<T extends TextInputAreaDesc> extends StatefulWidget with ViewWidgetMixin {

  TitleWidgetBridge<T> _bridge;

  TextEditingController _editingController;

  TextInputAreaWidget(this._bridge) : super() {

    _editingController = TextEditingController(text: _bridge.value);
    _bridge.addValueListener((value) {
      if(value == _editingController.text)
        return;
      _editingController.text = value;
    });
  }

  @override
  createState() => _TextInputAreaWidgetState();
}

class _TextInputAreaWidgetState extends State<TextInputAreaWidget> {

  @override
  Widget build(BuildContext context) {

    var desc = widget._bridge.desc;
    var editController = widget._editingController;

    Widget w = TextField(

      scrollPadding: EdgeInsets.all(0),
      decoration: InputDecoration(fillColor: Colors.grey, contentPadding: EdgeInsets.all(0), border: InputBorder.none, hintText: desc.placeholder != "" ? desc.placeholder: "请输入" + desc.title),
      controller: editController,
      maxLength: desc.maxLength.intValue,
      maxLines: 4,
      onChanged: (value){
        widget._bridge.value = value;
      },
    );

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

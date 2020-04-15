import 'package:flutter/material.dart';
import 'package:xtion_engine_widget/displaymode_desc.dart';
import 'package:xtion_engine_widget/flex_direction_desc.dart';
import 'package:xtion_engine_widget/view_widget_mixin.dart';
import 'package:xtion_engine_widget/divider_container.dart';
import 'package:xtion_engine_widget/round_container.dart';
import 'package:xtion_engine_widget/title_h_input_container.dart';
import 'package:xtion_widget/viewdesc/dropdownbox_desc.dart';
import 'package:xtion_engine_widget/widget_bridge/title_widget_bridge.dart';
import 'DropdownBoxMenu.dart';


class DropdownBoxWidget<T extends DropdownBoxDesc> extends StatefulWidget with ViewWidgetMixin {

  TitleWidgetBridge<T> _bridge;

  TextEditingController _editingController;

  DropdownBoxWidget(this._bridge) : super() {

    _editingController = TextEditingController(text: _bridge.value);
    _bridge.addValueListener((value) {
      if(value == _editingController.text)
        return;
      _editingController.text = value;
    });
  }

  @override
  createState() => _DropdownBoxWidgetState();
}

class _DropdownBoxWidgetState extends State<DropdownBoxWidget> {

  @override
  Widget build(BuildContext context) {

    var desc = widget._bridge.desc;
    var editController = widget._editingController;

    var textField = TextField(
      controller: editController,
      readOnly: true,
      textAlign: TextAlign.right,
      decoration: InputDecoration(fillColor: Colors.grey, border: InputBorder.none, hintText: desc.placeholder != "" ? desc.placeholder: "请选择" + desc.title),
    );

    Stack stack = Stack(children: <Widget>[
      Row(children: <Widget>[Expanded(child: textField,),],),
      DropdownBoxMenu<String>(
        initialValue: editController.text,
        itemBuilder: (BuildContext context) {

          List<PopupMenuItem<String>> items = new List();

          desc.options.forEach((f) =>
              items.add(PopupMenuItem<String>(value: f["text"], child: new Text(f["text"], )))
          );

          return items;
        },
        onSelected: (String value) {

          editController.text = value;
          widget._bridge.value = value;
          setState(() {

          });

        },
        child: Container(color: Colors.transparent,),),
    ]);

    Widget w = Expanded(
      child: stack
    );

    Widget ass = Image.asset('images/dropdownbox_indicator.png', package: 'xtion_widget',);

    w = TitleHInputContainer(desc.title, desc.required.boolValue, w, associatedWidget: ass);

    w = RoundContainer(w, desc.margin.edgeInsetValue, desc.size.heightValue);

    if(desc.displayMode.defalutValue == DisplayMode.plain)
      w = DividerContainer(w);

    if(desc.parantFlexDirection.directionValue() == FlexDirection.vertical) {

    }

    return w;
  }
}

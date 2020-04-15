import 'package:flutter/material.dart';
import 'package:xtion_engine_widget/displaymode_desc.dart';
import 'package:xtion_engine_widget/flex_direction_desc.dart';
import 'package:xtion_engine_widget/view_widget_mixin.dart';
import 'package:xtion_engine_widget/divider_container.dart';
import 'package:xtion_engine_widget/round_container.dart';
import 'package:xtion_engine_widget/title_h_input_container.dart';
import 'package:xtion_widget/SelfExpendable.dart';
import 'package:xtion_engine_widget/widget_bridge/title_widget_bridge.dart';

import 'viewdesc/textinput_desc.dart';

class TextInputWidget<T extends TextInputDesc> extends StatefulWidget with ViewWidgetMixin, SelfExpendable {

  TitleWidgetBridge<T> _bridge;

  TextEditingController _editingController;

  TextInputWidget(this._bridge) : super() {

    _editingController = TextEditingController(text: _bridge.value);
    _bridge.addValueListener((value) {
      if(value == _editingController.text)
        return;
      _editingController.text = value;
    });
  }

  @override
  createState() => _TextInputWidgetState();

  @override
  bool selfExpend() {
    return true;
  }

}

class _TextInputWidgetState extends State<TextInputWidget> {

  var _focusNode = FocusNode();
  var _associatedWidgetNotifier = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {

    var desc = widget._bridge.desc;
    var editController = widget._editingController;

    Widget w = Expanded(
      child: TextField(
        textAlign: TextAlign.right,
        decoration: InputDecoration(fillColor: Colors.grey, border: InputBorder.none, hintText: desc.placeholder != "" ? desc.placeholder: "请输入" + desc.title),
        controller: editController,
        onChanged: _textInputCoreOnValueChanged,
        focusNode: _focusNode..addListener((){ _textInputCoreOnFocus(editController.text, _focusNode.hasFocus); }),
      ),
    );

    var ass = _TitleInputAssociatedWidget(_associatedWidgetNotifier, (){
      editController.text = "";
      //手动修改text不会触发onChanged事件
      _textInputCoreOnValueChanged("");
    });

    w = TitleHInputContainer(desc.title, desc.required.boolValue, w, associatedWidget: ass);

    w = RoundContainer(w, desc.margin.edgeInsetValue, desc.size.heightValue);

    if(desc.displayMode.defalutValue == DisplayMode.plain)
      w = DividerContainer(w);

    if(desc.parantFlexDirection.directionValue() == FlexDirection.vertical) {

    }
    else {
      w = Expanded(child: w,);
    }

    return w;
  }

  void _textInputCoreOnValueChanged(String text) {

    var isEmpty = text.isEmpty;
    _associatedWidgetNotifier.value = isEmpty;

 //   widget._bridge.notifyVM(text);
    widget._bridge.value = text;
  }

  void _textInputCoreOnFocus(String text, bool isOnFocus) {

    var isEmpty = text.isEmpty;

    if(isOnFocus && !isEmpty) {
      _associatedWidgetNotifier.value = false;
    }
    else {
      _associatedWidgetNotifier.value = true;
    }
  }
}

class _TitleInputAssociatedWidget extends StatefulWidget {

  ValueNotifier<bool> _hidden;

  void Function() _onTapUp;

  _TitleInputAssociatedWidget(this._hidden, this._onTapUp);

  @override
  createState() => _TitleInputAssociatedWidgetState();
}

class _TitleInputAssociatedWidgetState extends State<_TitleInputAssociatedWidget> {

  @override
  void initState() {
    super.initState();

    widget._hidden.addListener(associatedWidgetListener);
  }

  @override
  Widget build(BuildContext context) {

    return Offstage(offstage: widget._hidden.value,
        child:
        GestureDetector(child:
        Image.asset('images/textinput_close.png', package: 'xtion_widget',), onTapUp: (TapUpDetails details) {
          widget._onTapUp();
        },));
  }

  @override
  void dispose() {
    super.dispose();

    widget._hidden.removeListener(associatedWidgetListener);
  }

  void associatedWidgetListener() {
    setState(() {
    });
  }

}
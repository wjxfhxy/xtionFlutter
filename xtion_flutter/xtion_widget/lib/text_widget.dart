
import 'package:flutter/material.dart';
import 'package:xtion_engine_widget/view_widget_mixin.dart';
import 'package:xtion_widget/SelfExpendable.dart';
import 'package:xtion_widget/viewdesc/text_desc.dart';
import 'package:xtion_engine_widget/displaymode_desc.dart';
import 'package:xtion_engine_widget/divider_container.dart';
import 'package:xtion_widget/widget_bridge/text_bridge.dart';

class TextWidget<T extends TextDesc> extends StatefulWidget with ViewWidgetMixin, SelfExpendable {

  TextBridge<T> _bridge;

  TextWidget(this._bridge): super();

  @override
  createState() => _TextWidgetState();

  @override
  bool selfExpend() {

//    if(_controller._desc.flex.intValue > 0)
//      return true;
//    if(_controller._desc.flexGrow.intValue > 0)
//      return true;
    return false;
  }
}

class _TextWidgetState extends State<TextWidget> {

  @override
  void initState() {
    super.initState();

    widget._bridge.addValueListener((dynamic value) {
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    var desc = widget._bridge.desc;

    var value = widget._bridge.value;

    var textColor = desc.textColor.colorValue;

    var fontSize = desc.fontSize.doubleValue;

    var lineNumber = desc.lineNumber.intValue;

    var textStyle = TextStyle(color: textColor, fontSize: fontSize, );

    Text textWidget = Text(value, style: textStyle, maxLines: lineNumber, textAlign: desc.textAlign.alignValue,);

    Widget w = textWidget;

    if(desc.margin.edgeInsetValue != null ||
        desc.padding.edgeInsetValue != null ||
        desc.borderVisible.boolValue) {

      var boxDecoration;
      if(desc.borderVisible.boolValue) {
        boxDecoration = BoxDecoration(border: Border.all(color: textColor, width: 1));
      }

      w = Container(child: textWidget,
        margin: desc.margin.edgeInsetValue,
        padding: desc.padding.edgeInsetValue,
        decoration: boxDecoration,
      );
    }

    var maxWidth = desc.maxSize.widthValue;
    if(maxWidth != null) {
      w = LimitedBox(child: w, maxWidth: maxWidth,);
    }

    var flexGrow = desc.flexGrow.intValue;
    if(flexGrow > 0) {

      w = Expanded(child: w, flex: flexGrow,);
    }

    if(desc.displayMode.displayModeValue == DisplayMode.plain) {

      w = DividerContainer(w);
    }

    return w;
  }
}

import 'package:xtion_engine_widget/widget_bridge/widget_bridge.dart';
import 'package:xtion_engine_widget/widget_bridge/value_bridge.dart';
import 'package:xtion_widget/viewdesc/text_desc.dart';

class TextBridge<T extends TextDesc> extends WidgetBridge<T> with ValueBridge {

  TextBridge(
    T desc
  ): super(desc);

  @override
  get descValue => desc.value;
}
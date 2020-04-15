
import 'package:xtion_engine_widget/title_view_desc.dart';
import 'package:xtion_engine_widget/widget_bridge/value_bridge.dart';
import 'package:xtion_engine_widget/widget_bridge/widget_bridge.dart';

class TitleWidgetBridge<T extends TitleViewDesc> extends WidgetBridge<T> with ValueBridge {

  TitleWidgetBridge(
    T desc
  ): super(desc);

  @override
  get descValue => desc.value;




}
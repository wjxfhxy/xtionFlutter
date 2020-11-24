import 'package:flutter/material.dart';
import 'package:xtion_engine_widget/widget_bridge/widget_bridge.dart';
import 'package:xtion_ui/yoga.dart';
import 'package:xtion_engine_widget/view_widget_mixin.dart';
import 'package:xtion_widget/viewdesc/layout_desc.dart';

class LayoutWidget<T extends LayoutDesc> extends StatelessWidget with ViewWidgetMixin {

  WidgetBridge<T> _bridge;

  LayoutWidget(this._bridge): super();

  @override
  Widget build(BuildContext context) {

    var flex = _bridge.desc.flex.intValue;
    var overflow = _bridge.desc.overflow == "0" ? YogaOverflow.none : YogaOverflow.auto;

    return Yoga(overflow: overflow, flex: flex, children: subWidgets,);

//    return Expanded(
//      child: CustomScrollView(
//        shrinkWrap: false,
//        slivers: <Widget>[
//          SliverPadding(
//            padding: const EdgeInsets.all(0.0),
//            sliver: SliverList(
//              delegate: SliverChildListDelegate(subWidgets),
//            ),
//          ),
//        ],
//      ),
//    );
  }
}

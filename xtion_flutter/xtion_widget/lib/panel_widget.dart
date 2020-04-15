import 'package:flutter/material.dart';
import 'package:xtion_engine_widget/view_widget_mixin.dart';
import 'package:xtion_widget/viewdesc/panel_desc.dart';

class PanelWidget extends StatelessWidget with ViewWidgetMixin {

  PanelDesc _desc;

  PanelWidget(this._desc);

  @override
  Widget build(BuildContext context) {

    Widget w;

    if(_desc.flex.intValue == 0) {

      w = _noScrollPanelSpace();
    }
    else {
      w = _scrollPanelSpace();
    }

    return w;
  }

  Widget _noScrollPanelSpace() {

    return Column(children: subWidgets);
  }


  Widget _scrollPanelSpace() {

    Widget w = CustomScrollView(
      shrinkWrap: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(0.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(subWidgets),
          ),
        ),
      ],
    );

    w = Expanded(child: w,);

    return w;

//    return CustomScrollView(
//      shrinkWrap: false,
//      slivers: <Widget>[
//        SliverPadding(
//          padding: const EdgeInsets.all(0.0),
//          sliver: SliverList(
//            delegate: SliverChildListDelegate(<Widget>[
//              Column(
//                  children: subWidgets
//                      .map((c) => Row(
//                    children: <Widget>[
//                      (c is SelfExpendable) && !(c as SelfExpendable).selfExpend()  ? Expanded( child: c, ) : c ],
//                  )).toList())
//            ]),
//          ),
//        ),
//      ],
//    );
  }
}
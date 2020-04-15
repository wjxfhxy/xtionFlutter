import 'package:flutter/material.dart';
import 'package:xtion_engine_widget/view_widget_mixin.dart';
import 'package:xtion_widget/SelfExpendable.dart';
import 'package:xtion_widget/textinput_widget.dart';

class LayoutWidget extends StatelessWidget with ViewWidgetMixin {
  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: CustomScrollView(
        shrinkWrap: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(0.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(subWidgets),
            ),
          ),
        ],
      ),
    );

//    return Expanded(
//      child: CustomScrollView(
//        shrinkWrap: false,
//        slivers: <Widget>[
//          SliverPadding(
//            padding: const EdgeInsets.all(0.0),
//            sliver: SliverList(
//              delegate: SliverChildListDelegate(<Widget>[
//                Column(
//                    children: subWidgets
//                        .map((c) => Row(
//                              children: <Widget>[
//                                (c is SelfExpendable) && !(c as SelfExpendable).selfExpend()  ? Expanded( child: c, ) : c ],
//                            )).toList())
//              ]),
//            ),
//          ),
//        ],
//      ),
//    );
  }
}

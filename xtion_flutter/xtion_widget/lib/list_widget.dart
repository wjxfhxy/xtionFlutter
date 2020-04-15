
import 'package:flutter/material.dart';
import 'package:xtion_engine_widget/view_widget_mixin.dart';
import 'package:xtion_widget/widget_bridge/list_bridge.dart';
import 'viewdesc/list_desc.dart';


class ListWidget<T extends ListDesc> extends StatefulWidget with ViewWidgetMixin {

  ListBridge<T> _bridge;

  ListWidget(this._bridge): super();

  @override
  createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {

  @override
  void initState() {
    super.initState();

    widget._bridge.reloadDataListen = () {

      setState((){});
    };
  }

  @override
  Widget build(BuildContext context) {

//    var listView =  ListView.separated (
//      scrollDirection: Axis.vertical,
//      shrinkWrap: false,
//      itemCount: 2,
//      physics: new ClampingScrollPhysics(),
//      itemBuilder: (context, i) => widget._controller.itemBuilder(i),
//      separatorBuilder: (BuildContext context, int index) {
//        return new Divider(height: 1.0, color: Colors.blue,);
//      },
//    );

    var listView = ListView.custom(
        scrollDirection: Axis.vertical,
        shrinkWrap: false,
        physics: new ClampingScrollPhysics(),
        childrenDelegate: SliverChildBuilderDelegate( (BuildContext context, int index) {
          final int itemIndex = index ~/ 2;
          Widget w;
          if (index.isEven) {
            w = widget._bridge.itemBuilder(itemIndex);
         //   w = Row(children: <Widget>[Checkbox(value: true, activeColor: Colors.blue,), Expanded(child: w,)],);
          } else {
            w = Divider(height: 1, thickness: 1, color: Colors.grey,);
          }
          return w;
        },
          childCount: 3000 * 2,
          addAutomaticKeepAlives: true,
          addRepaintBoundaries: true,
          addSemanticIndexes: true,
          semanticIndexCallback: (Widget _, int index) {
            return index.isEven ? index ~/ 2 : null;
          },
        )
    );

    return Expanded(child: listView,);
}

//class ListWidget extends StatelessWidget with ViewWidgetMixin {
//
//  ListDescription _desc;
//
//  Widget Function(int index) _itemBuilder;
//
//  int Function() _itemCount;
//
//  ListWidget(this._desc, this._itemBuilder, this._itemCount): super();
//
//  @override
//  Widget build(BuildContext context) {
//
//    var listView =  ListView.builder(
//        scrollDirection: Axis.vertical,
//        shrinkWrap: false,
//        itemCount: _itemCount(),
//        physics: new ClampingScrollPhysics(),
//        itemBuilder: (context, i) => _itemBuilder(i)
//    );
//
//    return Expanded(child: listView,);
//  }
//
}
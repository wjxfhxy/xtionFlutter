
import 'package:flutter/material.dart';

class TitleHInputContainer extends StatelessWidget {

  String _title;

  bool _isRequire;

  Widget _widget;

  Widget _associatedWidget;

  TitleHInputContainer(this._title, this._isRequire, this._widget, {Widget associatedWidget}) : super() {

    _associatedWidget = associatedWidget;
  }

  @override
  Widget build(BuildContext context) {

    var widget = Row(
      children: <Widget>[
        SizedBox(width: 12, child:
        _isRequire ? Stack(alignment: AlignmentDirectional.center, children: <Widget>[Text("*", style: TextStyle(color: Colors.red, height: 2))],) : null
        ),
        Text(_title),
        SizedBox(width: 12,),
        _widget,
        SizedBox(width: 5,),
        SizedBox(width: 15, child: _associatedWidget ?? Container(),),
        SizedBox(width: 12,),
      ],
    );

//    return Container(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[row],), height: 40, margin: EdgeInsets.all(0),);
  //  return RowContainerWidget(row);
    return widget;
  }
}
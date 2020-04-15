
import 'package:flutter/material.dart';

class TitleInputContainer extends StatelessWidget {

  String _title;

  bool _isRequire;

  Widget _widget;

  Axis _childDirection;

  TitleInputContainer(this._title, this._isRequire, this._widget, { Axis childDirection = Axis.horizontal}) : super() {

    this._childDirection = childDirection;
  }

  @override
  Widget build(BuildContext context) {

    Widget widget;
    
    if(_childDirection == Axis.horizontal) {

      widget = Row(
        children: <Widget>[
          SizedBox(width: 12, child:
          _isRequire ? Stack(alignment: AlignmentDirectional.center, children: <Widget>[Text("*", style: TextStyle(color: Colors.red, height: 2))],) : null
          ),
          Text(_title),
          SizedBox(width: 12,),
          _widget,
          SizedBox(width: 12,),
        ],
      );
    }
    else {

      widget = Row(
        children: <Widget>[
          SizedBox(width: 12, child:
          _isRequire ? Stack(alignment: AlignmentDirectional.center, children: <Widget>[Text("*", style: TextStyle(color: Colors.red, height: 2))],) : null
          ),
          Text(_title),
          SizedBox(width: 12,),
        ],
      );
      
      widget = Column(children: <Widget>[SizedBox(height: 12,), widget, Row(children: <Widget>[Expanded(child: Container(margin: EdgeInsets.all(12), child: _widget, ),)],) ],);
    }

//    return Container(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[row],), height: 40, margin: EdgeInsets.all(0),);
  //  return RowContainerWidget(row);
    return widget;
  }
}
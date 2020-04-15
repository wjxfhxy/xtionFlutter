
import 'package:flutter/material.dart';

class DividerContainer extends StatelessWidget {

  Widget _child;

  DividerContainer(this._child) : super();

  @override
  Widget build(BuildContext context) {

//    return Container(child: Column(children: <Widget>[Expanded(child: _child,)],), height: 40, margin: EdgeInsets.all(0),
//      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),);
    return Container(child: Align(child: _child, alignment: Alignment.center,),
       decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),);
  }
}
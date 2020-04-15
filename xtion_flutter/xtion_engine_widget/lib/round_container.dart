
import 'package:flutter/material.dart';

class RoundContainer extends StatelessWidget {

  Widget _child;

  EdgeInsets _margin;

  double _height;

  RoundContainer(this._child, this._margin, this._height,) : super();

  @override
  Widget build(BuildContext context) {

    Widget widget = Container(margin: _margin, height: _height, child: _child,);

    return widget;
  }

}
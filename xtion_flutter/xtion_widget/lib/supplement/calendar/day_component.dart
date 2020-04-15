import 'package:flutter/material.dart';

class DayWidget extends StatefulWidget {

  String _text;
  Color _textColor;

  DayWidget(this._textColor, this._text) {

  }


  @override
  State<StatefulWidget> createState() => _DayWidgetState();
}

class _DayWidgetState extends State<DayWidget> {

  @override
  Widget build(BuildContext context) {

    return Center(child: Text(widget._text ,textAlign: TextAlign.center, style: TextStyle(color: widget._textColor)),);
  }
}
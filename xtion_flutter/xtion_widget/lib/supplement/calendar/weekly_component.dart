
import 'package:flutter/material.dart';

class WeeklyWidget extends StatelessWidget {

  String _text;

  WeeklyWidget(this._text);

  @override
  Widget build(BuildContext context) {

    return Text(_text, textAlign: TextAlign.center,);
  }
}
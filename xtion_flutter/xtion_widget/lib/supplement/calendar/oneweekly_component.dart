
import 'package:flutter/material.dart';
import 'weekly_component.dart';

class OneWeeklyWidget extends StatelessWidget {

  final _weeklyText = ["日", "一", "二", "三", "四", "五", "六", ];

  @override
  Widget build(BuildContext context) {

    List<Expanded> rowWidget = List();

    for(int i = 0; i < _weeklyText.length; i++) {

      WeeklyWidget weeklyWidget = WeeklyWidget(_weeklyText[i]);
      Expanded expanded = Expanded(child: weeklyWidget,);
      rowWidget.add(expanded);
    }

    Row row = Row(children: rowWidget);
    return row;
  }

}
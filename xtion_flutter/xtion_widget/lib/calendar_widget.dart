
import 'package:flutter/material.dart';
import 'package:xtion_engine_widget/view_widget_mixin.dart';
import 'supplement/calendar/calendar.dart';

class CalendarWidget extends StatefulWidget with ViewWidgetMixin {

  @override
  createState() => _CalendarWidgetState();

}

class _CalendarWidgetState extends State<CalendarWidget> {

  @override
  Widget build(BuildContext context) {

    return CalendarBaseWidget(DayWidgetTextColor);
  }

  Color DayWidgetTextColor(DateTime datetime) {

    var now = DateTime.now();
    if(datetime.day == now.day && datetime.month == now.month)
      return Colors.green;
    return null;
  }
}
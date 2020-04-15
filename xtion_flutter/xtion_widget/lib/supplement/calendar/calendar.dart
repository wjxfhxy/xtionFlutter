
import 'package:flutter/material.dart';
import 'month_component.dart';
import 'oneweekly_component.dart';


class CalendarBaseWidget extends StatefulWidget {

  Color Function(DateTime datetime) dayWidgetTextColor;

  CalendarBaseWidget(this.dayWidgetTextColor);

  @override
  State<StatefulWidget> createState() => _CalendarBaseWidgetState();
}

class _CalendarBaseWidgetState extends State<CalendarBaseWidget>  {

  var currnet = DateTime.now();

  @override
  Widget build(BuildContext context) {

    OneWeeklyWidget oneWeeklyWidget = OneWeeklyWidget();

    PageView pageView = PageView.builder(
      onPageChanged: (position) {

      },

      itemBuilder: (context, index) {

        var year = currnet.year;
        var month = currnet.month;

        if(index > 1) {
          month += 1;
          if(month > 12) {
            year += 1;
            month = 1;
          }
        }
        else if(index < 1) {
          month -= 1;
          if(month < 1) {
            year -= 1;
            month = 12;
          }
        }

        var dt = DateTime(year, month, 1);

        MonthWidget monthWidget = MonthWidget(dt, widget.dayWidgetTextColor);
        return monthWidget;
      },
      itemCount: 3,
      controller: PageController(initialPage: 1)
    );

    Column column = Column(children: <Widget>[oneWeeklyWidget,
      Container(child: pageView, height: MediaQuery.of(context).size.width / 7 * 6,)],);

    return column;
  }
}
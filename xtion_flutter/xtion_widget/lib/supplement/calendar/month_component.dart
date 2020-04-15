
import 'package:flutter/material.dart';
import 'day_component.dart';

class MonthWidget extends StatefulWidget {

  Color Function(DateTime datetime) dayWidgetTextColor;

  DateTime currentDatetime;

  MonthWidget(this.currentDatetime, this.dayWidgetTextColor);

  @override
  State<StatefulWidget> createState() => _MonthWidgetState();
}

class _MonthWidgetState extends State<MonthWidget> {

  final int rowNum = 6;
  final int colNum = 7;

  @override
  Widget build(BuildContext context) {

    var datetime = widget.currentDatetime;

    var datetimes = oneMonthDateTimes(datetime);
    assert(datetimes.length == 42);

    GridView gridView = GridView.builder(
        addAutomaticKeepAlives: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: colNum,),
        itemCount: colNum * rowNum,
        itemBuilder: (context, index) {

          var dt = datetimes[index];
          var textColor = widget.dayWidgetTextColor(dt);
          var tmp = dt.month == datetime.month ? Colors.black : Colors.grey;
          if(textColor == null)
            textColor = tmp;

          DayWidget dayWidget = DayWidget(textColor, dt.day.toString());

          return dayWidget;
        });

    return gridView;
  }

  //每月第一天
  int firstWeekdayOfMonth(DateTime dt) {

    var today = dt;
    var year = today.year;
    var month = today.month;
    var weekday = DateTime(year, month, 1).weekday;
    return weekday;
  }

  //大小月
  var bigMonths = [1, 3, 5, 7, 8, 10, 12];
  var littleMonths = [4, 6, 9, 11];
  var specialMonth = 2;

  var bigMonthDay = 31;
  var littleMonthDay = 30;
  int get specialMonthDay {

    if(isLeapYear())
      return 29;
    return 28;
  }

  //是否闰年
  bool isLeapYear() {

    var today = DateTime.now();
    var year = today.year;

    //可以被400整除
    //可以被4整除的，但不能被100整除
    if(year % 400 == 0)
      return true;
    if(year % 4 == 0 && year % 100 != 0)
      return true;

    return false;
  }

  var weekDayIndex = {7: 1, 1: 2, 2: 3, 3: 4, 4: 5, 5: 6, 6: 7};

  List<DateTime> prefixWeekDatetimesOfMonth(DateTime dt) {

    var today = dt;
    var year = today.year;
    var month = today.month;

    var m = 0;
    if(month == 1)
      m = 12;
    else
      m = month - 1;

    var weekday = DateTime(year, month, 1).weekday;

    var lastDay = 0;
    if(bigMonths.contains(m)) {
      lastDay = bigMonthDay;
    }
    else if(littleMonths.contains(m)) {
      lastDay = littleMonthDay;
    }
    else {
      lastDay = specialMonthDay;
    }

    var index = weekDayIndex[weekday];
    index -= 1;
    if(index <= 0)
      index = 7;

    List list = List();
    for(index; index >= 1; index--) {
      var d = lastDay - index + 1;
      list.add(d);
    }

    if(month == 1)
      year -= 1;

    return list.map((f) => DateTime(year, m, f)).toList();
  }

  List<DateTime> suffixWeekDatetimesOfMonth(DateTime dt) {

    var today = dt;
    var year = today.year;
    var month = today.month;

    var m = month;

    var lastDay = 0;
    if(bigMonths.contains(m)) {
      lastDay = bigMonthDay;
    }
    else if(littleMonths.contains(m)) {
      lastDay = littleMonthDay;
    }
    else {
      lastDay = specialMonthDay;
    }

    var weekday = DateTime(year, month, lastDay).weekday;
    var index = weekDayIndex[weekday];
    index += 1;
    if(index > 7)
      index = 1;

    List list = List();
    for(index; index <= 7; index++) {
      var d = list.length + 1;
      list.add(d);
    }

    //补多一个星期
    if(lastDay == bigMonthDay || lastDay == littleMonthDay) {
      var firstWeek = DateTime(year, month, 1).weekday;
      var firstIndex = weekDayIndex[firstWeek];
      if(firstIndex != 1) {
        var t = lastDay - (7 - firstIndex + 1);
        var tt = t ~/ 7;
        if(tt == 3) {
          index = 1;
          for(index; index <= 7; index++) {
            var d = list.length + 1;
            list.add(d);
          }
        }
      }
    }

    if(month == 12 )
      year += 1;

    m += 1;

    return list.map((f) => DateTime(year, m, f)).toList();
  }

  List<DateTime> oneMonthDateTimes(DateTime dt) {

    var today = dt;
    var year = today.year;
    var month = today.month;

    var m = month;

    var a = prefixWeekDatetimesOfMonth(today);
    var b = suffixWeekDatetimesOfMonth(today);

    var lastDay = 0;
    if(bigMonths.contains(m)) {
      lastDay = bigMonthDay;
    }
    else if(littleMonths.contains(m)) {
      lastDay = littleMonthDay;
    }
    else {
      lastDay = specialMonthDay;
    }

    List<DateTime> total = List();
    total += a;
    for(int i = 1; i <= lastDay; i++) {
      total.add(DateTime(year, month, i));
    }
    total += b;



    return total;
  }
}
library flutter_app_calen;

import 'package:flutter/material.dart';
//import 'package:flutter_app_calen/year_title.dart';

class ScrollingYearsCalendar extends StatefulWidget {
  ScrollingYearsCalendar({
    @required this.context,
    @required this.initialDate,
    @required this.firstDate,
    @required this.lastDate,
    @required this.currentDateColor,
    this.highlightedDates,
    this.highlightedDateColor,
    this.monthNames,
    this.onMonthTap,
  })  : assert(context != null),
        assert(initialDate != null),
        assert(firstDate != null),
        assert(lastDate != null),
        assert(!initialDate.isBefore(firstDate),
            'initialDate must be on or after firstDate'),
        assert(!initialDate.isAfter(lastDate),
            'initialDate must be on or before lastDate'),
        assert(!firstDate.isAfter(lastDate),
            'lastDate must be on or after firstDate'),
        assert(currentDateColor != null),
        assert(highlightedDates == null || highlightedDateColor != null,
            'highlightedDateColor is required if highlightedDates is not null'),
        assert(
            monthNames == null || monthNames.length == DateTime.monthsPerYear,
            'monthNames must contain all months of the year');

  final BuildContext context;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final Color currentDateColor;
  final List<DateTime> highlightedDates;
  final Color highlightedDateColor;
  final List<String> monthNames;
  final Function onMonthTap;

  @override
  _ScrollingYearsCalendarState createState() => _ScrollingYearsCalendarState();
}

class _ScrollingYearsCalendarState extends State<ScrollingYearsCalendar> {

  @override
  Widget build(BuildContext context) {
    final int _itemCount = widget.lastDate.year - widget.firstDate.year + 1;
    return ListView.separated(
      itemCount: _itemCount,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (BuildContext context, int index) {
        final int year = index + widget.firstDate.year;
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: Container(
            margin: EdgeInsets.all(5),
            child: Center(
              child: Text(
                year.toString(),
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          onTap: (){
            print(year);
            Navigator.pop(context);

          },
        );
      },
    );
  }
  
}

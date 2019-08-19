/*
Created by Vishnuvardhan reddy
date   16 august 2019
 */

import 'package:flutter/material.dart';
import 'calendar.dart';

class ScrollingYearsCalendar extends StatefulWidget {
  ScrollingYearsCalendar({
    this.calendarInstance,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.currentDateColor,
    this.highlightedDates,
    this.highlightedDateColor,
    this.monthNames,
    this.onMonthTap,
  });

  final CalendarChooseState calendarInstance;
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
            Navigator.pop(context);
            widget.calendarInstance.yearResult(year);

          },
        );
      },
    );
  }
  
}

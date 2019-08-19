/*
Created by Yogesh Marathe
date 19 august 2019
description : holds the day each day details
 */

import 'package:flutter/material.dart';

class DayMonthDetailModel {
  dynamic day;
  int month, year;
  String weekDay;
  BorderRadius borderRadius = BorderRadius.all(Radius.circular(30));
  Color selectedColor = Colors.white;
  Color selectedTextColor = Colors.black;
  Color textColor = Colors.black;
}

class TempMonthDetails{
  String month;
  int year;
}

class YearCallback{
  void yearResult(int year){}
}

class Constant{
  static String BIRTHDAY="birthday";
  static String BOOKING="notrangebooking";
  static String BOOKING_RANGE="inrangebooking";
  static String FUTUREYEARS="futureyears";
}


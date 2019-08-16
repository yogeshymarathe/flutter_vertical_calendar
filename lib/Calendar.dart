import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CalendarChoose extends StatefulWidget {
  bool rangeDate;
  CalendarChoose(this.rangeDate);

  @override
  State<StatefulWidget> createState() {
    return CalendarChooseState();
  }
}

class CalendarChooseState extends State<CalendarChoose> {
  List weeks = ["M", "T", "W", "T", "F", "S", "S"];
  List days_in_month = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  List months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  List<List<DayMonthDetailModel>> daysOfMonth;
  final TRUE = 1;
  final FALSE = 0;
  List<int> dayCodeList = List();
  int dayCode;
  double currentMonth = 0.0;
  ScrollController scrollController;
  int lastSelectedMonth, lastSelectedDay;
  bool isLastSelected = false;
  String selectedDate;
  int startMonthIndex = 0;
  int startDayIndex = 0;
  int endMonthIndex = 0;
  int endDayIndex = 0;
  @override
  void initState() {
    daysOfMonth = List();
    determineleapyear(2019);
    determinedaycode(2019);
    scrollController = new ScrollController(initialScrollOffset: 11.0);
    for (int i = 1; i <= 12; i++) {
      calendarMonth(2019, i);
    }
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() {
        scrollController.jumpTo(currentMonth * 300);
      });
    });
    super.initState();
  }

  Widget appBar() {
    return PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height
        child: AppBar(
          title: Text("Selecte date"),
          actions: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.pop(context, selectedDate);
                },
                child: Image.asset(
                  "images/tick.png",
                  color: Colors.white,
                ))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: appBar(),
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(color: Color(0xfffB8B8B8)),
                height: 30,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemExtent: MediaQuery.of(context).size.width / 7,
                  itemCount: weeks.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        height: 30,
                        child: Center(
                            child: Text(
                          "${weeks[index]}",
                          style: TextStyle(color: Colors.white),
                        )));
                  },
                ),
              ),
              Expanded(
                child: ListView.separated(
                  controller: scrollController,
                  itemCount: daysOfMonth.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 28 * daysOfMonth.length / 0.9,
                      child: Container(child: monthList(index)),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                ),
              ),
            ],
          ),
        ));
  }

  void determinedaycode(int year) {
    int d1, d2, d3;

    d1 = ((year - 1) / 4.0).floor();
    d2 = ((year - 1) / 100).floor();
    d3 = ((year - 1) / 400).floor();
    dayCode = (year + d1 - d2 + d3) % 7;

    print("mydaycode, $dayCode");
  }

  Widget monthList(indexMonth) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Row(
            children: <Widget>[
              Text("${months[indexMonth]}",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold)),
              SizedBox(
                width: 3,
              ),
              Text("2019",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold))
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2.3,
          child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: daysOfMonth[indexMonth].length != 0
                  ? daysOfMonth[indexMonth].length
                  : 0,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () async {
                      dateOnTapSelection(indexMonth, index);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: daysOfMonth[indexMonth][index].selectedColor,
                            borderRadius:
                                daysOfMonth[indexMonth][index].borderRadius),
                        child: Center(
                            child: Text(
                          "${daysOfMonth[indexMonth][index].day}",
                          style: TextStyle(
                              color: daysOfMonth[indexMonth][index]
                                  .selectedTextColor),
                        ))));
              }),
        ),
      ],
    );
  }

  int tapIncrement = 1;

  void setColorToDay(indexMonth, index) {
    daysOfMonth[indexMonth][index].selectedColor = Colors.blue;
    daysOfMonth[indexMonth][index].selectedTextColor = Colors.white;
  }

  void setColorLighBlueToDay(indexMonth, index) {
    if (daysOfMonth[indexMonth][index].day != "") {
      daysOfMonth[indexMonth][index].borderRadius =
          BorderRadius.all(Radius.circular(10));
      daysOfMonth[indexMonth][index].selectedColor = Colors.lightBlueAccent;
      daysOfMonth[indexMonth][index].selectedTextColor = Colors.white;
    }
  }

  void showRangeSelection() {
    print("startMontheInexe ${daysOfMonth.length}  ${dayCodeList.length}");
    if (startMonthIndex == endMonthIndex) {
      print("rangeSelection if");
      int tempDate = startDayIndex;
      while (startDayIndex != endDayIndex) {
        if (startDayIndex != tempDate)
          setColorLighBlueToDay(startMonthIndex, startDayIndex);
        else {
          daysOfMonth[startMonthIndex][startDayIndex].borderRadius =
              BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10));
        }
        startDayIndex++;
      }
    } else {
      print("rangeSelection else");
      for (int j = startDayIndex;
          j < daysOfMonth[startMonthIndex].length;
          j++) {
        if (j != startDayIndex)
          setColorLighBlueToDay(startMonthIndex, j);
        else
          daysOfMonth[startMonthIndex][j].borderRadius = BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10));
      }
      startMonthIndex = startMonthIndex + 1;

      while (startMonthIndex != endMonthIndex) {
        for (int k = 0; k < daysOfMonth[startMonthIndex].length; k++) {
          print("whileloopyexecuted");
          setColorLighBlueToDay(startMonthIndex, k);
        }
        startMonthIndex++;
      }

      for (int l = 0; l < endDayIndex; l++) {
        setColorLighBlueToDay(startMonthIndex, l);
      }
    }
  }

  void dateOnTapSelection(indexMonth, index) {
    setState(() {
      if (widget.rangeDate) {
        if (tapIncrement == 1) {
          selectedDate =
              "${daysOfMonth[indexMonth][index].day}/${daysOfMonth[indexMonth][index].month}/${daysOfMonth[indexMonth][index].year}";
          setColorToDay(indexMonth, index);
          startMonthIndex = indexMonth;
          startDayIndex = index;
        } else if (tapIncrement == 2) {
          selectedDate +=
              "  ${daysOfMonth[indexMonth][index].day}/${daysOfMonth[indexMonth][index].month}/${daysOfMonth[indexMonth][index].year}";
          setColorToDay(indexMonth, index);
          daysOfMonth[indexMonth][index].borderRadius = BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30));
          endMonthIndex = indexMonth;
          endDayIndex = index;
          showRangeSelection();
        }
        tapIncrement = tapIncrement + 1;
      } else {
        daysOfMonth[indexMonth][index].selectedColor = Colors.blue;
        daysOfMonth[indexMonth][index].selectedTextColor = Colors.white;
        selectedDate =
            "${daysOfMonth[indexMonth][index].day}/${daysOfMonth[indexMonth][index].month}/${daysOfMonth[indexMonth][index].year}";
        if (isLastSelected) {
          daysOfMonth[lastSelectedMonth][lastSelectedDay].selectedColor =
              Colors.white;
          daysOfMonth[lastSelectedMonth][lastSelectedDay].selectedTextColor =
              Colors.black;
        }
        isLastSelected = true;
        lastSelectedDay = index;
        lastSelectedMonth = indexMonth;
      }
    });
  }

  int determineleapyear(int year) {
    if (year % 4 == FALSE && year % 100 != FALSE || year % 400 == FALSE) {
      days_in_month[2] = 29;
      return TRUE;
    } else {
      days_in_month[2] = 28;
      return FALSE;
    }
  }

  calendarMonth(int year, indexMonth) async {
    List<DayMonthDetailModel> dmdmList = List();
    int month = indexMonth, day;
    // Correct the position for the first date
    for (day = 1; day < dayCode; day++) {
      DayMonthDetailModel localDMDM = DayMonthDetailModel();
      localDMDM.day = "";
      localDMDM.month = 0;
      localDMDM.weekDay = "";
      dmdmList.add(localDMDM);
    }

    // Print all the dates for one month
    for (day = 1; day <= days_in_month[month]; day++) {
      DayMonthDetailModel localDMDM = DayMonthDetailModel();
      localDMDM.day = day;
      localDMDM.month = month;
      localDMDM.year = year;
      if (DateTime.now().month == indexMonth && DateTime.now().day == day) {
        localDMDM.selectedColor = Colors.blue;
        currentMonth = indexMonth.toDouble();
      }
      dmdmList.add(localDMDM);
    }
    // Set position for next month
    dayCodeList.add(dayCode);
    dayCode = (dayCode + days_in_month[month]) % 7;

    daysOfMonth.add(dmdmList);
  }
}

class DayMonthDetailModel {
  dynamic day;
  int month, year;
  String weekDay;
  BorderRadius borderRadius = BorderRadius.all(Radius.circular(30));
  Color selectedColor = Colors.white;
  Color selectedTextColor = Colors.black;
  Color textColor = Colors.black;
}

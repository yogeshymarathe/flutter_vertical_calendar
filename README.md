<img src="screenshot/calendar_screenshot.gif" width=300 height=600>
Makes an interesting splash effect when tapping its child widget.  
  
## Getting Started  
  
To use this plugin, add `calendar_vertical_scroll` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).  
  
This is the calendar for the scenarios like **Birthday**, **booking** and **future years**. **Booking** has two options single date pick and range date pick. **birthday** and **future** calendar has year selection functions. 
 
### Birthday calendar (select past years)
```text
     CalendarChoose(
                     Calendar.BIRTHDAY,
                     currentDateFontColor: Colors.blue,
                     currentDateBackgroundColor:
                     Colors.amberAccent,
                     selectionBackgroundColor: Colors.amber,
                     selectionFontColor: Colors.green,
                  )));

```
### Booking Calendar (from current month to next 12 months)
```text
 CalendarChoose(Calendar.BOOKING)));
```

### single date pick Booking Calendar (from current month to next 12 months)
```text
 CalendarChoose(Calendar.BOOKING)));
```

### Range date pick Booking Calendar (from current month to next 12 months)
```text
  CalendarChoose.range()));
```
### future year can be pick ,future Calendar (from current month to next 12 months)
```text
   CalendarChoose(Calendar.FUTUREYEARS)));
```

### Example  
  
```dart  
import 'package:calendar_vertical/day_details_model.dart';
import 'package:flutter/material.dart';
import 'calendar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String strDate = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar Select Date"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(strDate),
              RaisedButton(
                  onPressed: () async {
                    strDate = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CalendarChoose(
                                  Calendar.BIRTHDAY,
                                  currentDateFontColor: Colors.blue,
                                  currentDateBackgroundColor:
                                      Colors.amberAccent,
                                  selectionBackgroundColor: Colors.amber,
                                  selectionFontColor: Colors.green,
                                )));
                    if (strDate == null) strDate = "";
                  },
                  child: Text("Birthday")),
              RaisedButton(
                  onPressed: () async {
                    strDate = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CalendarChoose(Calendar.BOOKING)));
                    if (strDate == null) strDate = "";
                  },
                  child: Text("Booking")),
              RaisedButton(
                  onPressed: () async {
                    strDate = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CalendarChoose.range()));
                    if (strDate == null) strDate = "";
                  },
                  child: Text("Booking range")),
              RaisedButton(
                  onPressed: () async {
                    strDate = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CalendarChoose(Calendar.FUTUREYEARS)));
                    if (strDate == null) strDate = "";
                  },
                  child: Text("future years")),
            ],
          ),
        ),
      ),
    );
  }
}
```

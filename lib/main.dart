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
  String strDate="";
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
                  onPressed: () async{
                    strDate=await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CalendarChoose(type:Constant.BOOKING_RANGE)));
                    if(strDate==null)
                      strDate="";
                  },
                  child: Text("click")),
            ],
          ),
        ),
      ),
    );
  }
}



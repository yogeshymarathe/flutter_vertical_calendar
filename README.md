
Makes an interesting splash effect when tapping its child widget.  
  
## Getting Started  
  
To use this plugin, add `splash_tap` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).  
  
The color can be set with the **splashColor** property. The splash size is dependent on the size of the child widget passed in - which is constrained by the **minRadius** and **maxRadius** parameters.
  
### Example  
  
```dart  
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
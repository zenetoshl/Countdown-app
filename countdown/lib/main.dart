import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
          primarySwatch: Colors.deepOrange,
          brightness: Brightness.dark,
          backgroundColor: Colors.black,
          scaffoldBackgroundColor: Colors.black),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var now = new DateTime.now();
  final _random = new Random();
  DateTime deathDate;
  var difference;
  String countdown;

  int next(int min, int max) => min + _random.nextInt(max - min);
  String _newDate() {
    var _year = next(now.year, 2100);
    var _month = _year == now.year ? next(now.month, 12) : next(1, 12);
    var _day = (_month == now.month && _year == now.year)
        ? next(now.day < 28 ? now.day + 1 : 1, 28)
        : next(1, 28);
    var _hours = next(0, 23);
    var _minutes = next(0, 59);
    var _seconds = next(0, 59);
    String month = _month < 10 ? '0${_month}' : '${_month}';
    String day = _day < 10 ? '0${_day}' : '${_day}';
    String hours = _hours < 10 ? '0${_hours}' : '${_hours}';
    String minutes = _minutes < 10 ? '0${_minutes}' : '${_minutes}';
    String seconds = _seconds < 10 ? '0${_seconds}' : '${_seconds}';
    return '${_year}-${month}-${day} ${hours}:${minutes}:${seconds}';
  }

  calculateAge(DateTime deathDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - deathDate.year;
    int month1 = currentDate.month;
    int month2 = deathDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = deathDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return -1 * age;
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return '0$n';
    }

    int months = (duration.inDays / 30).floor();
    String twoDigitMonth = twoDigits(months.remainder(12));
    String twoDigitDays = twoDigits(duration.inDays.remainder(30));
    String twoDigitHours = twoDigits(duration.inHours.remainder(24));
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigitMonth}-${twoDigitDays} $twoDigitHours:$twoDigitMinutes:$twoDigitSeconds";
  }

  String formatedDifference(DateTime deathDate) {
    now = new DateTime.now();
    var diff = deathDate.difference(now);
    return '${calculateAge(deathDate)}-${_printDuration(diff)}';
  }

  void _update(DateTime deathDate) {
    setState(() {
      countdown = formatedDifference(deathDate);
    });
  }

  void initState() {
    super.initState();
    deathDate = DateTime.parse(_newDate());
    countdown = formatedDifference(deathDate);

    Timer.periodic(Duration(seconds: 1), (Timer t) => _update(deathDate));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${countdown.substring(0, 2)}',
              style: TextStyle(
                  fontSize: 110.0,
                  color: countdown.substring(0, 2) == '00'
                      ? Colors.red[900]
                      : Colors.white,
                  fontWeight: FontWeight.w200),
            ),
            Text(
              '${countdown.substring(3, 5)}',
              style: TextStyle(
                  fontSize: 110.0,
                  color: (countdown.substring(0, 2) == '00' &&
                          countdown.substring(3, 5) == '00')
                      ? Colors.red[900]
                      : Colors.white,
                  fontWeight: FontWeight.w200),
            ),
            Text(
              '${countdown.substring(6, 8)}',
              style: TextStyle(
                  fontSize: 110.0,
                  color: (countdown.substring(0, 2) == '00' &&
                          countdown.substring(3, 5) == '00' &&
                          countdown.substring(6, 8) == '00')
                      ? Colors.red[900]
                      : Colors.white,
                  fontWeight: FontWeight.w200),
            ),
            Text(
              '${countdown.substring(9, 11)}',
              style: TextStyle(
                  fontSize: 110.0,
                  color: (countdown.substring(0, 2) == '00' &&
                          countdown.substring(3, 5) == '00' &&
                          countdown.substring(6, 8) == '00' &&
                          countdown.substring(9, 11) == '00')
                      ? Colors.red[900]
                      : Colors.white,
                  fontWeight: FontWeight.w200),
            ),
            Text(
              '${countdown.substring(12, 14)}',
              style: TextStyle(
                  fontSize: 110.0,
                  color: (countdown.substring(0, 2) == '00' &&
                          countdown.substring(3, 5) == '00' &&
                          countdown.substring(6, 8) == '00' &&
                          countdown.substring(9, 11) == '00' &&
                          countdown.substring(12, 14) == '00')
                      ? Colors.red[900]
                      : Colors.white,
                  fontWeight: FontWeight.w200),
            ),
            Text(
              '${countdown.substring(15, 17)}',
              style: TextStyle(
                  fontSize: 110.0,
                  color: (countdown.substring(0, 2) == '00' &&
                          countdown.substring(3, 5) == '00' &&
                          countdown.substring(6, 8) == '00' &&
                          countdown.substring(9, 11) == '00' &&
                          countdown.substring(12, 14) == '00' &&
                          countdown.substring(15, 16) == '00')
                      ? Colors.red[900]
                      : Colors.white,
                  fontWeight: FontWeight.w200),
            ),
          ],
        ),
      ),
    );
  }
}

/**

  calculateAge(DateTime deathDate) {
  DateTime currentDate = DateTime.now();
  int age = currentDate.year - deathDate.year;
  int month1 = currentDate.month;
  int month2 = deathDate.month;
  if (month2 > month1) {
    age--;
  } else if (month1 == month2) {
    int day1 = currentDate.day;
    int day2 = deathDate.day;
    if (day2 > day1) {
      age--;
    }
  }
  return age;
}

String func(){
  now = new DateTime.now();
  var _then = now;
  _then.add(new Duration(: 60));
  difference = deathDate.difference(now);

}
String _printDuration(Duration duration) {
        String twoDigits(int n) {
          if (n >= 10) return "$n";
          return "0$n";
        }
        String twoDigitHours = twoDigits(duration.inHours.remainder(24));
        String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
        String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
        return "${twoDigits(duration.inDays)} $twoDigitHours:$twoDigitMinutes:$twoDigitSeconds";
  } */

import 'package:age_calculator/calculator_age.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'birth_block.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Age Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String year, month, day;

  DateTime now = new DateTime.now();
  DateTime birthday;

  @override
  void initState() {
    super.initState();
    year = DateTime.now().year.toString();
    month = DateTime.now().month.toString();
    day = DateTime.now().day.toString();
    birthday = DateTime(int.parse(year), int.parse(month), int.parse(day));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF333333),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'logo.png',
              width: 150,
            ),
            SizedBox(height: 30),
            Text(
              'Calculate your age easy and fast',
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont('Poppins',
                  fontSize: 30, color: Color(0xFFFAFAFA)),
            ),
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: BirthBlock(
                  onDayChanged: (_day) => setState(() {
                    day = _day;
                    birthday = DateTime(
                        int.parse(year), int.parse(month), int.parse(day));
                  }),
                  onMonthChanged: (_month) => setState(() {
                    month = _month;
                    birthday = DateTime(
                        int.parse(year), int.parse(month), int.parse(day));
                  }),
                  onYearChanged: (_year) => setState(() {
                    year = _year;
                    birthday = DateTime(
                        int.parse(year), int.parse(month), int.parse(day));
                  }),
                ),
              ),
            ),
            Hero(
              year: AgeCalculator().calculateAge(birthday).year.toString(),
              month: AgeCalculator().calculateAge(birthday).month.toString(),
              day: AgeCalculator().calculateAge(birthday).day.toString(),
            )
          ],
        ),
      ),
    );
  }
}

class Hero extends StatelessWidget {
  Hero({this.year, this.month, this.day});

  final String year, month, day;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 100, bottom: 10),
              width: 400,
              child: MyText(
                text: 'Your Age Is',
                size: 30,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  text: year,
                  size: 60,
                  bold: true,
                ),
                SizedBox(width: 6),
                MyText(
                  text: 'Years',
                  bold: true,
                  size: 20,
                ),
                SizedBox(width: 15),
                MyText(
                  text: month,
                  size: 60,
                  bold: true,
                ),
                SizedBox(width: 6),
                MyText(
                  text: 'Months',
                  bold: true,
                  size: 20,
                ),
                SizedBox(width: 15),
                MyText(
                  text: day,
                  size: 60,
                  bold: true,
                ),
                SizedBox(width: 6),
                MyText(
                  text: 'Days',
                  bold: true,
                  size: 20,
                ),
                SizedBox(width: 15),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  final double size;
  final bool bold;
  final String text;

  MyText({
    @required this.text,
    this.size,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.getFont(
        'Poppins',
        color: Color(0xFFFAFAFA),
        fontSize: size,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}

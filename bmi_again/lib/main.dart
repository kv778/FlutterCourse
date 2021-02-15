import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'package:bmi_again/screens/results_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E31),
        scaffoldBackgroundColor: Color(0xFF0A0E31),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/second': (context) => ResultsPage(),
      },
    );
  }
}

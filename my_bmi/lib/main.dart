import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BMI_Calc());
}

//const bottomColor: Color(0xFFEB1555);
const colour = Color(0xFF272A4D);

class BMI_Calc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.indigo[800],
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          title: Center(
            child: Text('BMI Calculator'),
          ),
        ),
        body: BMI(),
      ),
    );
  }
}

class BMI extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(colour: colour),
              ),
              Expanded(
                child: ReusableCard(colour: colour),
              ),
            ],
          ),
        ),

        Expanded(
          child: ReusableCard(colour: colour),
        ),

        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(colour: colour),
              ),
              Expanded(
                child: ReusableCard(colour: colour),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color colour;
  ReusableCard({this.colour});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}



import 'package:flutter/material.dart';

const kInactiveCardColor = Color(0xFF111328);
const kActiveCardColor = Color(0xFF1D1E33);
const kBottomContainerColor = Color(0xFFEB1555);

const kBottomContainerHeight = 80.0;

class ReusableCard extends StatelessWidget {
  ReusableCard({this.colour, this.cardChild, this.onPress});
  final Color colour;
  final Widget cardChild;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: colour,
        ),
        child: cardChild,
      ),
    );
  }
}
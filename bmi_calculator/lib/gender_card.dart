import 'package:flutter/material.dart';
import 'constants.dart';

class GenderCard extends StatelessWidget {
  GenderCard({this.displayIcon, this.displayText});
  final IconData displayIcon;
  final String displayText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          displayIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          displayText,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}

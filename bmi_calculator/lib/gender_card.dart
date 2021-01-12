import 'package:flutter/material.dart';

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
          style: TextStyle(
            fontSize: 25.0,
            color: Color(0xFF8D8E98),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

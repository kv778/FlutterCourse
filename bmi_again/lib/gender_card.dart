import 'package:flutter/material.dart';

const kIconSize = 90.0;
const kSizedBoxHeight = 15.0;

const kGenderTextStyle = TextStyle(
  fontSize: 18.0,
  letterSpacing: 2.0,
  fontWeight: FontWeight.bold,
  color: Color(0xFF8D8D98),
);

class GenderCard extends StatelessWidget {
  GenderCard({this.genderIcon, this.gender});
  final IconData genderIcon;
  final String gender;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: kIconSize,
        ),
        SizedBox(
          height: kSizedBoxHeight,
        ),
        Text(
          gender,
          style: kGenderTextStyle,
        ),
      ],
    );
  }
}

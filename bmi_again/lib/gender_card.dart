import 'package:flutter/material.dart';
import 'constants.dart';

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

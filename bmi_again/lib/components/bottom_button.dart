import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.buttonText, this.onPress});
  final Function onPress;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: kBottomContainerColor,
        height: kBottomContainerHeight,
        width: double.infinity,
        margin: EdgeInsets.only(top: 15.0),
        child: Center(
          child: Text(
            buttonText,
            style: kBottomContainerTextStyle,
          ),
        ),
      ),
    );
  }
}

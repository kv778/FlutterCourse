import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.buttonIcon, this.onPress});
  final IconData buttonIcon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      elevation: 5.0,
      child: Icon(
        buttonIcon,
        size: 25.0,
        color: Color(0xFF8D8D98),
      ),
      onPressed: onPress,
    );
  }
}

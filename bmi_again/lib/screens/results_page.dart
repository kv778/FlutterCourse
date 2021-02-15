import 'package:bmi_again/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_again/components/reusable_card.dart';
import 'package:bmi_again/components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI Calculator',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(15.0),
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Normal',
                    style: kResultTextStyle,
                  ),
                  Text(
                    '16.7',
                    style: kBMITextStyle,
                  ),
                  Text(
                    'Your BMI result is quite low, you should eat more',
                    style: kInterpretationStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonText: 'RE-CALCULATE',
            onPress: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

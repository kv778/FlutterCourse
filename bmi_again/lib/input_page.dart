import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'gender_card.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        print('Male card pressed');
                      });
                    },
                    child: ReusableCard(
                        colour: kInactiveCardColor,
                      cardChild: GenderCard(genderIcon: FontAwesomeIcons.mars, gender: 'MALE'),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        print('Female card pressed');
                      });
                    },
                    child: ReusableCard(
                      colour: kInactiveCardColor,
                      cardChild: GenderCard(genderIcon: FontAwesomeIcons.venus, gender: 'FEMALE',),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(colour: kInactiveCardColor),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: ReusableCard(colour: kInactiveCardColor),
                ),
                Expanded(
                  flex: 1,
                  child: ReusableCard(colour: kInactiveCardColor),
                ),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColor,
            height: kBottomContainerHeight,
            width: double.infinity,
            margin: EdgeInsets.only(top: 15.0),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'gender_card.dart';
import 'constants.dart';
import 'round_icon_button.dart';

enum Gender {
  Male,
  Female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 170;
  int weight = 70;
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
                  child: ReusableCard(
                    colour: selectedGender == Gender.Male? kActiveCardColor : kInactiveCardColor,
                    onPress: () {
                        setState(() {
                          selectedGender = Gender.Male;
                        });
                    },
                    cardChild: GenderCard(genderIcon: FontAwesomeIcons.mars, gender: 'MALE'),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    colour: selectedGender == Gender.Female? kActiveCardColor : kInactiveCardColor,
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    },
                    cardChild: GenderCard(genderIcon: FontAwesomeIcons.venus, gender: 'FEMALE',),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(''
                          'HEIGHT',
                        style: kGenderTextStyle,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        ' cm',
                        style: kGenderTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(0xFFEB1555),
                      inactiveTickMarkColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 14.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      min: 120.0,
                      max: 220.0,
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                      colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kGenderTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              ' kg',
                              style: kGenderTextStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              buttonIcon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  if(weight < 150)
                                    ++weight;
                                });
                              },
                            ),
                            RoundIconButton(
                              buttonIcon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  if(weight > 10)
                                    --weight;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ReusableCard(colour: kActiveCardColor),
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

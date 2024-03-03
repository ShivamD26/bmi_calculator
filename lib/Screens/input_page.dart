import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/resuable_card.dart';
import '../Components/icon_content.dart';
import '../constants.dart';
import 'package:bmi_calculator/Screens/result_page.dart';
import '../Components/bottom_button.dart';
import '../Components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender { no, male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 70;
  int age = 25;

  Gender selectedGender = Gender.no;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Expanded(
          child: Column(
            children: [
              //First Row
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        colour: selectedGender == Gender.male
                            ? activeCardColor
                            : inactiveCardColor,
                        cardchild: IconContent(
                          icn: FontAwesomeIcons.mars,
                          label: 'MALE',
                        )),
                  ),
                  Expanded(
                    child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        colour: selectedGender == Gender.female
                            ? activeCardColor
                            : inactiveCardColor,
                        cardchild: IconContent(
                          icn: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        )),
                  ),
                ],
              )),
              // Second Row
              Expanded(
                child: ReusableCard(
                  colour: activeCardColor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: kLabelStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kNumberStyle,
                          ),
                          Text(
                            'cm',
                            style: kLabelStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 10),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 20),
                        ),
                        child: Slider(
                            value: height.toDouble(),
                            min: 100,
                            max: 200,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            }),
                      ),
                    ],
                  ),
                ),
              ),
              // Third Row
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        colour: activeCardColor,
                        cardchild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "WEIGHT",
                              style: kLabelStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIcnButton(
                                  icn: FontAwesomeIcons.minus,
                                  onPress: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIcnButton(
                                  icn: FontAwesomeIcons.plus,
                                  onPress: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                  Expanded(
                    child: ReusableCard(
                        colour: activeCardColor,
                        cardchild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "AGE",
                              style: kLabelStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIcnButton(
                                  icn: FontAwesomeIcons.minus,
                                  onPress: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIcnButton(
                                  icn: FontAwesomeIcons.plus,
                                  onPress: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        )),

                    // child: ReusableCard(
                    //     colour: activeCardColor,
                    //     cardchild: IconContent(
                    //         icn: FontAwesomeIcons.plus, label: 'label')),
                  ),
                ],
              )),


              BottomPage(
                text: 'CALCULATE',

                onTap: () {

                  CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

                  Navigator.push((context), MaterialPageRoute(builder: (context) {
                    return ResultPage(
                      bmi: calc.calBmi(),
                      result: calc.getResult(),
                      intpretation: calc.getInterpretation(),
                    );
                  }));
                },
              )
            ],
          ),
        ));
  }
}



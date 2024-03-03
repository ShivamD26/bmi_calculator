import "package:flutter/material.dart";
import 'package:bmi_calculator/Components/resuable_card.dart';
import 'package:bmi_calculator/Screens/input_page.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/Components/bottom_button.dart';


class ResultPage extends StatelessWidget {
  ResultPage({required this.bmi, required this.result, required this.intpretation});
  final String bmi;
  final String intpretation;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  'YOUR RESULT',
                  style: kTitleStyle,
                ),
              ),
            ),
          ),

          Expanded(
            flex: 8,
              child: ReusableCard(
             cardchild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  result,
                style: kResultTextStyle,
                ),
                Text(
                  bmi ,
                  style: kBMITextStyle,
                ),
                Text(
                intpretation,
                style: kResultOutputStyle,
                textAlign: TextAlign.center,)

              ],

            ),
            onPress: (){

            },
            colour: activeCardColor,
          )
          ),
          BottomPage(
            text: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop((context)
              );
            },
          )
        ],
      )
    );
  }
}

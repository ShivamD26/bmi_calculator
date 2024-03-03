import 'dart:math';

import 'package:flutter/material.dart';

class CalculatorBrain{
  CalculatorBrain({required this.height, required this.weight});
  final int weight;
  final int height;
  double _bmi =22.2;

  String calBmi(){
    _bmi = weight / pow(height/100, 2);

    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25){
      return 'Overweight';
    }else if(_bmi < 18){
      return 'Underweight';
    }
    else{
      return 'Normal';
    }
  }

  String getInterpretation(){
    if(_bmi >= 25){
      return 'You have higher than normal body weight. Try Exercise.';
    }else if(_bmi < 18){
      return 'You have lower than normal body weight. Try eating more.';
    }
    else{
      return 'You have Normal body weight. Nice Job. Maintain it!';
    }
  }
}
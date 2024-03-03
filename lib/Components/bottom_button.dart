import 'package:flutter/material.dart';
import '../constants.dart';

class BottomPage extends StatelessWidget {
  BottomPage({required this.text, required this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: kLargeLabelStyle,
          ),
        ),
        color: bottomcontcolor,
        width: double.infinity,
        height: 50,
      ),
    );
  }
}
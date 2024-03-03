import 'package:flutter/material.dart';
import '../constants.dart';
class IconContent extends StatelessWidget {
  IconContent({required this.icn, required this.label});

  final IconData icn;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icn,
          color: iconColor,
          size: 80,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: TextStyle(
            color: iconColor,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}

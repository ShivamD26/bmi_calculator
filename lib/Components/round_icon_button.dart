import 'package:flutter/material.dart';


class RoundIcnButton extends StatelessWidget {
  RoundIcnButton({required this.icn, this.onPress});

  final IconData icn;

  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(icn),
      elevation: 6,
      disabledElevation: 6,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

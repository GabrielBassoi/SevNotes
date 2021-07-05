import 'package:flutter/material.dart';

class RadioWidget extends StatelessWidget {
  final Color borderColor;
  final Function click;
  final LinearGradient gradient;

  const RadioWidget(
    this.borderColor,
    this.click,
    this.gradient,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: click,
      child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 3.5),
            borderRadius: BorderRadius.circular(25),
            gradient: gradient,
          )),
    );
  }
}

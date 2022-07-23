import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  dynamic text;
  double fontSize;
  dynamic fontweight;
  dynamic color;
  bool isMax;
  CustomText({
    Key? key,
    this.isMax = true,
    this.text,
    this.color = Colors.white,
    this.fontSize = 16,
    this.fontweight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: isMax ? 2 : null,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontweight,
        overflow: isMax ? TextOverflow.ellipsis : null,
      ),
    );
  }
}

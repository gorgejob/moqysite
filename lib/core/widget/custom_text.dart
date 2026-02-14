import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
   CustomText({
    super.key,
    required this.text,
    required this.color,
    required this.fontsize,
    required this.textAlign ,
  });
  final String text;
  final Color color;
  final double fontsize;
  TextAlign textAlign ; 

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: fontsize,
      ),
    );
  }
}

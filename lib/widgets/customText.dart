import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color coler;
  final FontWeight wight;
  final int maxline;

  CustomText(
      {super.key,
      required this.text,
      this.fontSize = 16,
      this.maxline = 1,
      this.coler = Colors.black,
      this.wight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxline,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: wight,
        color: coler,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class buttonText extends StatelessWidget {
  const buttonText({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(label,
        style: TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontFamily: "Metropolis",
          fontWeight: FontWeight.w700,
        ));
  }
}

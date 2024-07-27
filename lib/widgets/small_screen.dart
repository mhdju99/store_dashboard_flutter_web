import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SmallScreen extends StatelessWidget {
  const SmallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Image.asset("assets/icons/logoo.png"),
    );
  }
}

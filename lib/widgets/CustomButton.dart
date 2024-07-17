// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget chaild;
  void Function()? onPressed;

   CustomButton({
    Key? key,
    this.onPressed,
    required this.chaild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 48,
      margin: const EdgeInsets.symmetric(horizontal: 1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.red,
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(211, 38, 38, 0.25),
                spreadRadius: 1,
                blurRadius: 9,
                blurStyle: BlurStyle.solid)
          ],
          border: Border.all(color: Colors.red)),
      child: MaterialButton(
        disabledColor: Colors.amber,

        // padding:
        //     const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        onPressed: onPressed,

        child: chaild,
      ),
    );
  }
}


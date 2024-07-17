// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  int minline;
  Widget? icon;
  int maxLines;
  String? Function(String?)? validate;
  void Function(String?)? onSave;
  TextInputType? type;
  CustomTextField(
      {Key? key,
      this.minline = 1,
      this.icon = const Icon(Icons.donut_large),
      this.maxLines = 8,
      required this.text,
      this.type,
      this.validate,
      this.onSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minline,
      maxLines: maxLines,
      keyboardType: type,
      obscureText: type == TextInputType.visiblePassword ? true : false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        prefixIcon: icon,
        labelText: text,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        labelStyle: const TextStyle(
          fontSize: 14,
          fontFamily: "Metropolis",
          fontWeight: FontWeight.w200,
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(18)),
        filled: true,
        fillColor: Colors.grey[300],
      ),
      validator: validate,
      onSaved: onSave,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}

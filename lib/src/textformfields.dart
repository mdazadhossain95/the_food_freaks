import 'package:flutter/material.dart';
import 'package:the_food_freaks/constants.dart';

class TextFields extends StatelessWidget {
  TextFields({Key? key, required this.hintText, required this.obscureText, required this.userIcon, required this.inputType, required this.onchange})
      : super(key: key);

  final String hintText;
  bool obscureText;
  IconData userIcon;
  TextInputType inputType;
  final Function(String) onchange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      margin: const EdgeInsets.only(top: 20.0),
      child: TextFormField(
        onChanged: onchange,
        obscureText: obscureText,
        keyboardType: inputType,
        decoration: InputDecoration(
          focusColor: kColor1,
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: kColor1)),
          prefixIcon: Icon(userIcon),
          hintText: hintText,
          fillColor: kWhite,
          filled: true,

        ),
      ),
    );
  }
}

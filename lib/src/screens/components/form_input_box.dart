import 'package:flutter/material.dart';
import 'package:the_food_freaks/constants.dart';

// Touhid
class LoginSignUpInputBox extends StatelessWidget {
  String labelText;
  final FormFieldValidator validator;
  final FormFieldSetter? onSave;
  final IconData icon;
  final ValueChanged? onChange;
  final bool obscureText;
  LoginSignUpInputBox(
      {Key? key,
      required this.labelText,
      required this.validator,
      this.onSave,
      required this.icon,
      this.onChange,
      required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: TextFormField(
        validator: validator,
        onSaved: onSave,
        onChanged: onChange,
        obscureText: obscureText,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kWhite),
            borderRadius: BorderRadius.circular(5.5),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: kWhite,
            ),
          ),
          prefixIcon: Icon(
            icon,
            color: kColor1,
          ),
          filled: true,
          fillColor: kWhite,
          hintText: labelText,
        ),
      ),
    );
  }
}

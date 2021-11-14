import 'package:flutter/material.dart';

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
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(5.5),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.red,
          ),
          filled: true,
          fillColor: Colors.red[50],
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}

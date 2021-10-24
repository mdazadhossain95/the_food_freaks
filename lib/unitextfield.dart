import 'package:flutter/material.dart';

class UniTextField extends StatelessWidget {
  const UniTextField({Key? key, required this.uniLabelText}) : super(key: key);

  final String uniLabelText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: uniLabelText,
      ),
    );
  }
}

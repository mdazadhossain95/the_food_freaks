import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String _hintText;
  final EdgeInsets _padding;

  const CustomTextInput({
    required String hintText,
    EdgeInsets padding = const EdgeInsets.only(left: 40),
    Key? key,
  })  : _hintText = hintText,
        _padding = padding,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: ShapeDecoration(
        color: Color(0xFFF2F2F2),
        shape: StadiumBorder(),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: _hintText,
          hintStyle: TextStyle(
            color: Color(0xFFB6B7B7),
          ),
          contentPadding: _padding,
        ),
      ),
    );
  }
}

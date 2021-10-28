import 'package:flutter/material.dart';
import 'signin_screen.dart';
import 'constants.dart';

void main() {
  runApp(
    const MaterialApp(
      home: TheFoodFreaks(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class TheFoodFreaks extends StatelessWidget {
  const TheFoodFreaks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: SignInScreen(),
      ),
    );
  }
}

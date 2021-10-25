import 'package:flutter/material.dart';
import 'start_screen.dart';


void main() {
  runApp(
    const MaterialApp(home: TheFoodFreaks()),
  );
}

class TheFoodFreaks extends StatelessWidget {
  const TheFoodFreaks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFECBEBE),
      body: Center(
        child: StartPage(),
      ),
    );
  }
}

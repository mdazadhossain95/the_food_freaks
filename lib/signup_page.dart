import 'package:flutter/material.dart';
import 'unitextfield.dart';
import 'main.dart';
import 'constants.dart';

class SighUpPage extends StatelessWidget {
  const SighUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Food Freaks'),
        backgroundColor: const Color(0xFFECBEBE),
      ),
      backgroundColor: const Color(0xFFECBEBE),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            Image.asset('images/The_Food_Freaks.png'),
            const UniTextField(uniLabelText: 'Email'),
            const SizedBox(height: 24),
            const UniTextField(uniLabelText: 'Username'),
            const SizedBox(height: 24),
            const UniTextField(uniLabelText: 'Password'),
            const SizedBox(height: 24),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TheFoodFreaks(),
                  ),
                );
              },
              color: kButtonColor2,
              shape: kRoundedRectangleBorder,
              child: const Text(
                'Sign Up',
                style: kButtonTextStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}

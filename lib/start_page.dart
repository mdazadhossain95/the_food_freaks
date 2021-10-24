import 'package:flutter/material.dart';
import 'home_page.dart';
import 'signup_page.dart';
import 'constants.dart';
import 'unitextfield.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(32),
      children: [
        Image.asset('images/The_Food_Freaks.png'),
        const UniTextField(uniLabelText: 'Username'),
        const SizedBox(height: 24),
        const UniTextField(uniLabelText: 'Password'),
        const SizedBox(height: 24),
        RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
          color: kButtonColor1,
          shape: kRoundedRectangleBorder,
          child: const Text(
            'Sign in',
            style: kButtonTextStyle,
          ),
        ),
        const SizedBox(height: 24.0),
        RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SighUpPage(),
              ),
            );
          },
          color: kButtonColor2,
          shape: kRoundedRectangleBorder,
          child: const Text(
            'Sign Up',
            style: kButtonTextStyle,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'package:the_food_freaks/constants.dart';
import '../unitextfield.dart';
import 'forgot_pas_screen.dart';
import '../home.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          Image.asset('images/The_Food_Freaks.png'),
          const SizedBox(height: 10),
          const UniTextField(uniLabelText: 'Username'),
          const SizedBox(height: 24),
          const UniTextField(uniLabelText: 'Password'),
          const SizedBox(height: 10),
          GestureDetector(
            child: const Text(
              "FORGOT PASSWORD?",
              style: kTextStyle,
              textAlign: TextAlign.right,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ForgotPasScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainHome(),
                ),
              );
            },
            color: kColor1,
            shape: kRoundedRectangleBorder,
            child: const Text(
              'Sign in',
              style: kButtonTextStyle,
            ),
          ),
          const SizedBox(height: 24.0),
          const Text(
            "DON'T HAVE ACCOUNT?",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SighUpPage(),
                ),
              );
            },
            color: kColor2,
            shape: kRoundedRectangleBorder,
            child: const Text(
              'Sign Up',
              style: kButtonTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../textformfields.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';
import 'package:the_food_freaks/src/user/signin_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: kColor1,
          title: const CustomText(
            text: 'The Food Freaks',
            size: 20,
            color: kWhite,
            weight: FontWeight.bold,
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50.0),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomText(
                      text: 'Sign Up',
                      size: 30,
                      weight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'images/The_Food_Freaks.png',
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFields(
                      onchange: (value) {
                        email = value;
                      },
                      hintText: 'Email',
                      obscureText: false,
                      userIcon: Icons.person,
                      inputType: TextInputType.emailAddress),
                  const SizedBox(height: 10),
                  TextFields(
                      onchange: (value) {
                        password = value;
                      },
                      hintText: 'Password',
                      obscureText: true,
                      userIcon: Icons.lock,
                      inputType: TextInputType.visiblePassword),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            try {
                              // ignore: unused_local_variable
                              final newUser =
                                  await _auth.createUserWithEmailAndPassword(
                                      email: email, password: password);
                            } catch (e) {
                              print(e);
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInScreen(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(kColor2),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)))),
                          child: const CustomText(
                            text: 'Sign Up',
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

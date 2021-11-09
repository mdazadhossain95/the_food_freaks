import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_food_freaks/src/user/registar.dart';
import 'package:the_food_freaks/constants.dart';
import '../textformfields.dart';
import 'forgot_pas_screen.dart';
import '../home.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static const String id = 'Signin_screen';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50.0),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CustomText(
                    text: 'Login',
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
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 10),
                TextFields(
                  onchange: (value) {
                    password = value;
                  },
                  hintText: 'Password',
                  obscureText: true,
                  userIcon: Icons.lock_sharp,
                  inputType: TextInputType.visiblePassword,
                ),
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
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        final newUser = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        // ignore: unnecessary_null_comparison
                        if (newUser != null) {
                          // Navigator.pushNamed(context, Home.id);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                          );
                        }
                      } catch (e) {
                        print(e);
                      }
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => Home(),
                      //   ),
                      // );
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(kColor1),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)))),
                    child: const CustomText(
                      text: 'Sign in',
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "DON'T HAVE ACCOUNT?",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Registration(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(kColor2),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
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
    );
  }
}

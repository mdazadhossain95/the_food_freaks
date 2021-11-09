import 'package:flutter/material.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/user/signin_screen.dart';
import '../textformfields.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';

class ForgotPasScreen extends StatefulWidget {
  const ForgotPasScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasScreenState createState() => _ForgotPasScreenState();
}

class _ForgotPasScreenState extends State<ForgotPasScreen> {
  late String email;
  late String oldpassword;
  late String newpassword;

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
                      text: 'Forgot Password',
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
                        oldpassword = value;
                      },
                      hintText: 'Old Password',
                      obscureText: true,
                      userIcon: Icons.lock,
                      inputType: TextInputType.visiblePassword),
                  const SizedBox(height: 10),
                  TextFields(
                      onchange: (value) {
                        newpassword = value;
                      },
                      hintText: 'New Password',
                      obscureText: true,
                      userIcon: Icons.lock,
                      inputType: TextInputType.visiblePassword),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
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
                            text: 'Submit',
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

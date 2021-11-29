import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/screens/components/form_input_box.dart';
import 'package:the_food_freaks/src/state/user_state.dart';
import 'package:the_food_freaks/src/user/signin_screen.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';
import 'package:the_food_freaks/src/notification/notification.dart';

// Touhid
class Registration extends StatefulWidget {
  static const routeName = '/registration-screens';

  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  UserState userState = UserState();
  String _useremail = '';
  String _password = '';
  String _confpassword = '';

  final _from = GlobalKey<FormState>();

  void _registerNow() async {
    var isValid = _from.currentState!.validate();
    if (!isValid) {
      return;
    }
    _from.currentState!.save();

    bool isregister = await Provider.of<UserState>(context, listen: false)
        .registerNow(_useremail, _password);
    if (isregister) {
      Navigator.of(context).pushReplacementNamed(SignInScreen.routeName);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Something is wrong. Try Again!!"),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Ok"),
                )
              ],
            );
          });
    }
  }

  @override
  void initState() {

    Provider.of<NotificationService>(context, listen: false).initialize();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: kColor1,
          title: const CustomText(
            text: 'Sign Up',
            size: 20,
            color: kWhite,
            weight: FontWeight.bold,
          ),
        ),
        body: Form(
          key: _from,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: Center(
                child: Consumer<NotificationService>(
                  builder: (context, model, _) =>
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 30.0),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'images/The_Food_Freaks.png',
                              height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          const SizedBox(height: 10),
                          LoginSignUpInputBox(
                            validator: (v) {
                              if (v!.isEmpty) {
                                return 'Enter Your Email';
                              }
                              return null;
                            },
                            onSave: (v) {
                              _useremail = v!;
                            },
                            labelText: "Enter Your Email",
                            icon: Icons.person,
                            obscureText: false,
                          ),
                          const SizedBox(height: 10),
                          LoginSignUpInputBox(
                            validator: (v) {
                              if (v!.isEmpty) {
                                return 'Enter Your Password';
                              }
                              return null;
                            },
                            onChange: (v) {
                              setState(() {
                                _confpassword = v;
                              });
                            },
                            onSave: (v) {
                              _password = v!;
                            },
                            labelText: "Enter Your Password",
                            icon: Icons.lock_sharp,
                            obscureText: true,
                          ),
                          const SizedBox(height: 10),
                          LoginSignUpInputBox(
                            validator: (v) {
                              if (_confpassword != v) {
                                return 'Confirm Password';
                              }
                              return null;
                            },
                            onSave: (v) {
                              setState(() {
                                _password = v;
                              });
                            },
                            labelText: "Confirm Password",
                            icon: Icons.lock_sharp,
                            obscureText: true,
                          ),
                          const SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    model.instantNotification();
                                    _registerNow();

                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all(kColor2),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(10.0)))),
                                  child: const CustomText(
                                    text: 'Sign Up',
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/connectivity_provider.dart';
import 'package:the_food_freaks/src/no_internet.dart';
import 'package:the_food_freaks/src/notification/notification.dart';
import 'package:the_food_freaks/src/state/user_state.dart';
import 'package:the_food_freaks/src/user/registar.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';

import '../home.dart';
import '../screens/components/form_input_box.dart';
import 'forgot_pas_screen.dart';

// Touhid
class SignInScreen extends StatefulWidget {
  static const routeName = '/sign-in-screens';

  const SignInScreen({Key? key}) : super(key: key);
  static const String id = 'Signin_screen';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  LocalStorage storage = LocalStorage('usertoken');
  UserState userState = UserState();
  String _useremail = '';
  String _password = '';
  final _form = GlobalKey<FormState>();

  void _loginNow() async {
    var isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    // calling usersate to function login
    bool istoken = await Provider.of<UserState>(context, listen: false)
        .loginNow(_useremail, _password);

    if (istoken) {
      Navigator.of(context).pushReplacementNamed(Home.routeName);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Invalid Credentials. Try Again!!"),
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
    Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();

    Provider.of<NotificationService>(context, listen: false).initialize();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: pageUI(),
      ),
    );
  }




  Widget pageUI() {
    return Consumer<ConnectivityProvider>(
      builder: (context, model, child) {
        // ignore: unnecessary_null_comparison
        if (model.isOnline != null) {
          return model.isOnline
              ? SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: _form,
              child: Center(
                child: Consumer<NotificationService>(
                    builder: (context, model, _) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'images/The_Food_Freaks.png',
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.3,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: kWhite,
                              boxShadow: [
                                BoxShadow(
                                    color: kGrey,
                                    offset: Offset(15, 5),
                                    blurRadius: 30)
                              ],
                            ),
                            child: LoginSignUpInputBox(
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
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: kWhite,
                              boxShadow: [
                                BoxShadow(
                                    color: kGrey,
                                    offset: Offset(15, 5),
                                    blurRadius: 30)
                              ],
                            ),
                            child: LoginSignUpInputBox(
                              validator: (v) {
                                if (v!.isEmpty) {
                                  return 'Enter Your Password';
                                }
                                return null;
                              },
                              onSave: (v) {
                                _password = v!;
                              },
                              labelText: "Enter Your Password",
                              icon: Icons.lock_sharp,
                              obscureText: true,
                            ),
                          ),
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
                            onPressed: () {
                              model.instantNotification();
                              _loginNow();
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(kColor1),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
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
                              child: Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                          const Registration(),
                                        ),
                                      );
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all(kColor2),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                    child: const CustomText(
                                      text: 'Sign Up',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                ),
              ),
            ),
          )
              : const NoInternet();
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

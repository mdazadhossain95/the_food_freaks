import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:the_food_freaks/src/user/signin_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    TheFoodFreaks(),
  );
}

class TheFoodFreaks extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("Something went Wrong");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SignInScreen(),
            );
          }
          return CircularProgressIndicator();
        });
  }
}


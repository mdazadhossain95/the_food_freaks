import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:the_food_freaks/src/user/registar.dart';
import 'package:the_food_freaks/src/user/signin_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const TheFoodFreaks(),
  );
}

class TheFoodFreaks extends StatelessWidget {
  const TheFoodFreaks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}

//
//
// class TheFoodFreaks extends StatefulWidget {
//   const TheFoodFreaks({Key? key}) : super(key: key);
//
//   @override
//   _TheFoodFreaksState createState() => _TheFoodFreaksState();
// }
//
// class _TheFoodFreaksState extends State<TheFoodFreaks> {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: TheFoodFreaks(),
//       debugShowCheckedModeBanner: false,
//
//     );
//   }
// }

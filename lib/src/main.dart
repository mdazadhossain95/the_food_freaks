import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:the_food_freaks/src/home.dart';
import 'package:the_food_freaks/src/notification/notification.dart';
import 'package:the_food_freaks/src/state/product_state.dart';
import 'package:the_food_freaks/src/state/user_state.dart';
import 'package:the_food_freaks/src/user/registar.dart';
import 'package:the_food_freaks/src/user/signin_screen.dart';

void main() => runApp(TheFoodFreaks());

// Touhid
class TheFoodFreaks extends StatelessWidget {
  const TheFoodFreaks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalStorage storage = LocalStorage('usertoken');
    // Using multi provider to communicate with different states all over the app
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NotificationService(), // ctx is context here
        ),
        ChangeNotifierProvider(
          create: (ctx) => UserState(), // ctx is context here
        ),
        ChangeNotifierProvider(
          create: (ctx) => ProductState(), // ctx is context here
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, // turn of the debug banner
        home: FutureBuilder(
            future: storage.ready,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              if (storage.getItem('token') == null) {
                return SignInScreen();
              }
              return Home();
            }),

        routes: {
          SignInScreen.routeName: (ctx) => const SignInScreen(),
          Home.routeName: (ctx) => Home(),
          Registration.routeName: (ctx) => Registration(),
        },
      ),
    );
  }
}

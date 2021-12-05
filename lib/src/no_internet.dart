import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: 200,
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("images/nonet.png"))),
        ),
        const Text(
          "No Internet Connection",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              'You are not connected to the internet. Make sure internet is on, Airplane Mode is off',
              style: TextStyle(fontSize: 16),
            ))
      ],
    );
  }
}

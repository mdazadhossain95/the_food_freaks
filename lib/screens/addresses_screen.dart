import 'package:flutter/material.dart';
import '../constants.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Addresses'),
        backgroundColor: kColor1,
      ),
    );
  }
}